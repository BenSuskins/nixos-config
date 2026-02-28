dgrep() {
  grep -iR "$@" * | grep -v "Binary"
}

pullall() {
  for d in */.git; do
    (
      cd "${d%/.git}" || continue
      echo "==> $PWD"
      git pull
      echo
    )
  done
}

pullmain() {
  for d in */.git; do
    (
      cd "${d%/.git}" || continue
      echo "==> $PWD"
      git checkout main
      git pull
      echo
    )
  done
}

showbranch() {
  for d in */.git; do
    (
      cd "${d%/.git}" || continue
      echo "==> $PWD"
      git branch --show-current
      echo
    )
  done
}

killport() {
  local port="$1"
  local pid
  pid=$(lsof -ti :"$port")
  if [ -n "$pid" ]; then
    echo "Killing process $pid on port $port"
    sudo kill -9 "$pid"
  else
    echo "No process found on port $port"
  fi
}

nixRun() {
  nix-shell -p "$1" --run "$1"
}

cdr() {
  cd $(git rev-parse --show-toplevel)
}

mkcd() {
  mkdir -p "$1" && cd "$1"
}

ff() {
  find . -type f -iname "*$1*"
}

fd() {
  find . -type d -iname "*$1*"
}

extract() {
  case "$1" in
    *.tar.bz2) tar xjf "$1" ;;
    *.tar.gz)  tar xzf "$1" ;;
    *.tar.xz)  tar xJf "$1" ;;
    *.bz2)     bunzip2 "$1" ;;
    *.gz)      gunzip "$1" ;;
    *.tar)     tar xf "$1" ;;
    *.zip)     unzip "$1" ;;
    *.7z)      7z x "$1" ;;
    *)         echo "'$1' cannot be extracted" ;;
  esac
}

serve() {
  python3 -m http.server "${1:-8000}"
}

path() {
  echo "$PATH" | tr ':' '\n'
}

ip() {
  curl -s ifconfig.me
}

weather() {
  curl -s "wttr.in/${1:-}?format=3"
}

help() {
  local reset="\033[0m"
  local bold="\033[1m"
  local dim="\033[2m"
  local cyan="\033[38;5;81m"
  local yellow="\033[38;5;228m"
  local magenta="\033[38;5;213m"
  local green="\033[38;5;120m"
  local gray="\033[38;5;240m"

  _row() {
    printf "  ${yellow}%-28s${reset} ${dim}│${reset} ${cyan}%s${reset}\n" "$1" "$2"
  }

  _section() {
    printf "\n  ${magenta}${bold}$1${reset}\n"
    printf "  ${gray}%s${reset}\n" "$(printf '─%.0s' {1..48})"
  }

  printf "\n  ${bold}${green}  Help${reset}\n"
  printf "  ${gray}%s${reset}\n" "$(printf '═%.0s' {1..48})"

  _section "General"
  _row "l"                    "eza -lah"
  _row "ls"                   "eza"
  _row "tree"                 "eza --tree --git-ignore"
  _row "cat"                  "bat"

  _section "Navigation"
  _row "../ .../ ....."       "go up 1 / 2 / 3 dirs"
  _row "cdr"                  "cd to git root"

  _section "Shortcuts"
  _row "g"                    "lazygit"

  _section "Utility"
  _row "copy / paste"         "pbcopy / pbpaste"
  _row "ports"                "show listening ports"

  _section "Nix"
  _row "nixconfig"            "open nix config"
  _row "nixclean"             "garbage collect"
  _row "rebuild"              "darwin-rebuild build"
  _row "switch"               "darwin-rebuild switch"
  _row "compare"              "diff closures"

  _section "SSH"
  _row "sshmedia"             "connect to media server"
  _row "sshdocker"            "connect to docker host"
  _row "sshgame"              "connect to game server"
  _row "sshmonitor"           "connect to monitor host"
  _row "sshdevelopment"       "connect to dev machine"

  _section "Git — Status & Info"
  _row "git st / ss"          "status / status -s"
  _row "git di / dc"          "diff / diff --cached"
  _row "git lg / lo"          "log graph / log oneline"
  _row "git last"             "last commit stats"

  _section "Git — Branching"
  _row "git br / bra"         "branch / branch -a"
  _row "git co / cob"         "checkout / checkout -b"
  _row "git sw / swc"         "switch / switch -c"

  _section "Git — Committing"
  _row "git ci"               "commit"
  _row "git cia / cian"       "amend / amend --no-edit"

  _section "Git — Staging"
  _row "git aa / ap"          "add --all / add -p"
  _row "git unstage"          "reset HEAD --"

  _section "Git — Stashing"
  _row "git sta / stap / stal" "stash / pop / list"

  _section "Git — Remote"
  _row "git pu / puf"         "push / push --force-with-lease"
  _row "git pl / fe"          "pull / fetch --all --prune"

  _section "Git — Rebase"
  _row "git rb / rbi"         "rebase / rebase -i"
  _row "git rba / rbc"        "abort / continue"
  _row "git rum"              "rebase main@{u}"

  _section "Git — Cleanup"
  _row "git gone"             "delete branches gone from remote"

  _section "Functions"
  _row "mkcd <dir>"           "mkdir and cd into it"
  _row "ff <pattern>"         "find files by name"
  _row "fd <pattern>"         "find directories by name"
  _row "killport <port>"      "kill process on port"
  _row "extract <file>"       "extract archive"
  _row "serve [port]"         "http server (default 8000)"
  _row "path"                 "show PATH entries"
  _row "ip"                   "show public IP"
  _row "weather [city]"       "show weather"
  _row "pullall"              "git pull in all subdirs"
  _row "pullmain"             "checkout main & pull in all subdirs"
  _row "showbranch"           "show branch in all subdirs"
  _row "nixRun <pkg>"         "run nix package"
  _row "dgrep <pattern>"      "recursive case-insensitive grep"

  printf "\n"
}

keys() {
  local reset="\033[0m"
  local bold="\033[1m"
  local dim="\033[2m"
  local cyan="\033[38;5;81m"
  local yellow="\033[38;5;228m"
  local magenta="\033[38;5;213m"
  local green="\033[38;5;120m"
  local gray="\033[38;5;240m"

  _key_row() {
    printf "  ${yellow}%-28s${reset} ${dim}│${reset} ${cyan}%s${reset}\n" "$1" "$2"
  }

  _section() {
    printf "\n  ${magenta}${bold}$1${reset}\n"
    printf "  ${gray}%s${reset}\n" "$(printf '─%.0s' {1..48})"
  }

  printf "\n  ${bold}${green}󰥻  Ghostty Keybinds${reset}\n"
  printf "  ${gray}%s${reset}\n" "$(printf '═%.0s' {1..48})"

  _section "Splits"
  _key_row "cmd + d"              "New split → right"
  _key_row "cmd + shift + d"      "New split ↓ down"
  _key_row "cmd + w"              "Close split"
  _key_row "cmd + shift + enter"  "Toggle zoom focused split"

  _section "Navigate Splits"
  _key_row "cmd + alt + ←/→/↑/↓" "Move between splits"

  _section "Resize Splits"
  _key_row "cmd + ctrl + ←/→/↑/↓" "Resize split (20px)"
  _key_row "cmd + ctrl + ="        "Equalize all splits"

  _section "Tabs"
  _key_row "cmd + t"              "New tab"
  _key_row "cmd + shift + ←/→"   "Previous / next tab"
  _key_row "cmd + 1–5"            "Jump to tab by number"

  _section "Font Size"
  _key_row "cmd + ="              "Increase font size"
  _key_row "cmd + -"              "Decrease font size"
  _key_row "cmd + 0"              "Reset font size"

  printf "\n"
}

