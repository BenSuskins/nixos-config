_:

let
  shared-casks = import ../shared/casks.nix;
in
shared-casks
++ [
  # Development Tools
  "intellij-idea"
  "podman-desktop"
  "mongodb-compass"
  "gcloud-cli"

  # Pairing
  "pop"
  "tuple"

  # Communication
  "ankerwork"
  "logi-options+"
  "slack"

  # Other
]
