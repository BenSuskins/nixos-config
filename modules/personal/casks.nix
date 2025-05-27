_:

let shared-casks = import ../shared/casks.nix; in
shared-casks ++ [
  # Development Tools
  "intellij-idea-ce"
  "postman"
  "docker"

  # Communication Tools
  "discord"

  # Entertainment Tools
  "vlc"
  "plex"

  # Productivity Tools
  "chatgpt"
  "google-drive"
  
  # Browsers
  "arc"
]
