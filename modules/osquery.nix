{ config
, pkgs
, lib
, ...
}:
with lib;
let
  cfg = config.services.osquery-bin;
  configFile = pkgs.writeText "osquery.conf" (
    builtins.toJSON (
      recursiveUpdate {
        schedule = {
          time_again = {
            query = "select * from time;";
            interval = 1;
          };
        };
        options = {
          config_plugin = "filesystem";
          logger_plugin = "filesystem";
          logger_path = cfg.loggerPath;
          database_path = cfg.databasePath;
          inherit (cfg) utc;
        };
      }
      cfg.extraConfig
    )
  );
in
{
  options = {
    services.osquery-bin = {
      enable = mkEnableOption "osquery";
      loggerPath = mkOption {
        type = types.path;
        description = "Base directory used for logging.";
        default = "${cfg.dataDir}/log";
      };
      flagsOption = mkOption {
        type = types.listOf types.str;
        description = "enable the feature with the corresponding CLI flags";
        default = [ ];
        example = [ "--enable_file_events=true" ];
      };
      dataDir = mkOption {
        type = types.path;
        description = "Path used for pid file.";
        default = "/var/lib/osquery";
      };
      pidfile = mkOption {
        type = types.path;
        description = "Path used for pid file.";
        default = "${cfg.dataDir}/osqueryd.pidfile";
      };
      package = mkOption {
        description = "osquery package to use.";
        default = pkgs.osquery-bin;
        type = types.package;
      };
      utc = mkOption {
        type = types.bool;
        description = "Attempt to convert all UNIX calendar times to UTC.";
        default = true;
      };
      databasePath = mkOption {
        type = types.path;
        description = "Path used for database file.";
        default = "${cfg.dataDir}/osquery.db";
      };
      extensionsPath = mkOption {
        type = types.path;
        description = "Path used for extensions_socket file";
        default = "${cfg.dataDir}/osquery.em";
      };
      extraConfig = mkOption {
        type =
          types.attrs
          // {
            merge = loc: foldl' (res: def: recursiveUpdate res def.value) { };
          };
        description = "Extra config to be recursively merged into the JSON config file.";
        default = { };
      };
    };
  };
  config = mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
    systemd.services.osquery = {
      after = [ "network.target" "syslog.service" ];
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.osquery-bin ];
      script = ''
        if [[ ! -d "${cfg.dataDir}/log" ]];then
           mkdir -p ${cfg.dataDir}/log
        fi
        cp -rf ${configFile} ${cfg.dataDir}/osquery.conf
        ${cfg.package}/bin/osqueryd --database_path ${cfg.databasePath} \
        --logger_path ${cfg.loggerPath} \
        --pidfile ${cfg.pidfile} \
        --database_path ${cfg.databasePath} \
        --extensions_socket  ${cfg.extensionsPath} \
        --config_path ${configFile} ${toString cfg.flagsOption}
      '';
      serviceConfig = {
        User = "root";
        Group = "root";
        WorkingDirectory = "${cfg.dataDir}";
        ReadWritePaths = "${cfg.dataDir}";
        RuntimeDirectory = "osquery";
        CacheDirectory = "osquery";
        StateDirectory = "osquery";
        Restart = "always";
        # FIXME:
        # PrivateTmp = true;
        # PrivateUsers = true;
        # PrivateDevices = true; #block BPF
        # ProtectClock = true;
        # ProtectKernelLogs = true;
      };
    };
  };
}
