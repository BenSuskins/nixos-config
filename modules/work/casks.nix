_:

let
  shared-casks = import ../shared/casks.nix;
in
shared-casks
++ [
  # Collaboration Tools
  "tuple"

  # Developer Tools
  "gcloud-cli"

  # Communication
  "ankerwork"
  "logi-options+"
  "slack"
]
