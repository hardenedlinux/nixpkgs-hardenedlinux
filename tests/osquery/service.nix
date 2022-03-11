{
  pkgs,
  config,
  ...
}: {
  services.osquery-bin = {
    enable = true;
    flagsOption = [
      "--enable_file_events=true"
      "--enable_syslog=true"
      "--syslog_pipe_path=${config.services.osquery-bin.dataDir}/syslog"
      "--enable_bpf_events=true"
      "--disable_audit=false"
    ];
    extraConfig =
      {} // (builtins.fromJSON (builtins.readFile ./osquery-default.json));
  };
}
