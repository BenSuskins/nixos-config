_:

let
  shared-casks = import ../shared/casks.nix;
in
shared-casks
++ [
  # Communication
  "ankerwork"
  "logi-options+"
]
