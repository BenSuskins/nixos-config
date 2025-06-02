_:

let shared-casks = import ../shared/casks.nix; in
shared-casks ++ [
  # Development Tools
  "intellij-idea"
  "podman"
  "podman-desktop"
  "hoppscotch"
  "mongodb-compass"

  # Pairing
  "pop"
  "tuple"

  # Communication
  "miro"
  "ankerwork"
  "logi-options+"
]
