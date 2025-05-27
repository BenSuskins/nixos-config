_:

let shared-casks = import ../shared/casks.nix; in
shared-casks ++ [
  # Development Tools
  "intellij-idea"
  "podman"
]
