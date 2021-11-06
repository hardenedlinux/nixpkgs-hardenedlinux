{ makeTest, pkgs, self }:
{
  osquery-vm-systemd = makeTest
    {
      name = "osquery-systemd";
      machine = {
        imports = [
          self.nixosModules.osquery-bin
          ./service.nix
        ];
        virtualisation = {
          memorySize = 4048;
          cores = 2;
        };
      };
      testScript = ''
        start_all()
        machine.wait_for_unit("network-online.target")
        machine.wait_for_unit("osquery.service")
        machine.sleep(2)
        print(machine.succeed("cat /var/lib/osquery/log/osqueryd.results.log"))
      '';
    }
    {
      inherit pkgs;
      inherit (pkgs) system;
    };
}
