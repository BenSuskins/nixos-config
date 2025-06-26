_:

let
  shared-casks = import ../shared/casks.nix;
in
shared-casks
++ [
  # Development Tools
  "intellij-idea-ce"
  "postman"
  "docker"
  "commander-one"
  "warp"

  # Communication Tools
  "discord"
  "drawio"

  # Entertainment Tools
  "vlc"
  "plex"

  # Productivity Tools
  "chatgpt"
  "google-drive"

  # Browsers
  "arc"
  "thebrowsercompany-dia"
]
