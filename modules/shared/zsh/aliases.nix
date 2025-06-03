{ hostRole }:
{
    # General
    nixconfig = "code ~/workspace/nixos-config";
    rebuild = "cd ~/workspace/nixos-config && darwin-rebuild build --flake .#${hostRole}";
    switch = "cd ~/workspace/nixos-config && sudo darwin-rebuild switch --flake .#${hostRole}";
    compare = "cd ~/workspace/nixos-config && nix store diff-closures /run/current-system ./result";

    # SSH
    sshmedia = "ssh -i ~/.ssh/homelab mediaserver@$MEDIA_SERVER_IP";
    sshdocker = "ssh -i ~/.ssh/homelab docker@$DOCKER_SERVER_IP";
    sshgame = "ssh -i ~/.ssh/homelab gameserver@$GAME_SERVER_IP";
    sshmonitor = "ssh -i ~/.ssh/homelab monitor@$MONITOR_SERVER_IP";
    sshdevelopment = "ssh -i ~/.ssh/homelab development@$DEVELOPMENT_SERVER_IP";
}