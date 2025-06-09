_:

let
  shared-casks = import ../shared/casks.nix;
in
shared-casks
++ [
  # Development Tools
  "intellij-idea"
  "podman-desktop"
  "hoppscotch"
  "mongodb-compass"
  "google-cloud-sdk"

  # Pairing
  "pop"
  "tuple"

  # Communication
  "miro"
  "ankerwork"
  "logi-options+"

  # Other
  "caffeine"
]
