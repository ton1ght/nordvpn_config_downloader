# Download NordVPN Configuration Files

To gather .ovpn configuration files for NordVPN, one has to manually download individual configurations from https://nordvpn.com/ovpn/. `getConfigs.sh` downloads scripts for the given parameters. `addConfigs.sh` adds those configurations to Network Manager and fills in the credentials.


With `-p <path>` you can provide a directory where the configuration files are stored. You can pass `-x` to `addConfigs.sh` in order to remove the configuration files from Network Manager.


I do not recommend using NordVPN.
