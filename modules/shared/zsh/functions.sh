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
  local BOLD='\033[1m'
  local CYAN='\033[36m'
  local GREEN='\033[32m'
  local YELLOW='\033[33m'
  local DIM='\033[2m'
  local RESET='\033[0m'

  echo -e "${BOLD}${CYAN}=== Shell Aliases ===${RESET}"
  echo ""
  echo -e "${YELLOW}General:${RESET}"
  echo -e "  ${GREEN}l${RESET}            ${DIM}eza -lah${RESET}"
  echo -e "  ${GREEN}ls${RESET}           ${DIM}eza${RESET}"
  echo -e "  ${GREEN}tree${RESET}         ${DIM}eza --tree --git-ignore${RESET}"
  echo -e "  ${GREEN}cat${RESET}          ${DIM}bat${RESET}"
  echo ""
  echo -e "${YELLOW}Navigation:${RESET}"
  echo -e "  ${GREEN}../.../.....${RESET} ${DIM}go up 1/2/3 dirs${RESET}"
  echo -e "  ${GREEN}cdr${RESET}          ${DIM}cd to git root${RESET}"
  echo ""
  echo -e "${YELLOW}Shortcuts:${RESET}"
  echo -e "  ${GREEN}g${RESET}            ${DIM}lazygit${RESET}"
  echo ""
  echo -e "${YELLOW}Utility:${RESET}"
  echo -e "  ${GREEN}copy/paste${RESET}   ${DIM}pbcopy/pbpaste${RESET}"
  echo -e "  ${GREEN}ports${RESET}        ${DIM}show listening ports${RESET}"
  echo ""
  echo -e "${YELLOW}Nix:${RESET}"
  echo -e "  ${GREEN}nixconfig${RESET}    ${DIM}open nix config${RESET}"
  echo -e "  ${GREEN}nixclean${RESET}     ${DIM}garbage collect${RESET}"
  echo -e "  ${GREEN}rebuild${RESET}      ${DIM}darwin-rebuild build${RESET}"
  echo -e "  ${GREEN}switch${RESET}       ${DIM}darwin-rebuild switch${RESET}"
  echo -e "  ${GREEN}compare${RESET}      ${DIM}diff closures${RESET}"
  echo ""
  echo -e "${YELLOW}SSH:${RESET}"
  echo -e "  ${GREEN}sshmedia, sshdocker, sshgame, sshmonitor, sshdevelopment${RESET}"
  echo ""
  echo -e "${BOLD}${CYAN}=== Git Aliases (git <alias>) ===${RESET}"
  echo ""
  echo -e "${YELLOW}Status & Info:${RESET}"
  echo -e "  ${GREEN}st/ss${RESET}        ${DIM}status / status -s${RESET}"
  echo -e "  ${GREEN}di/dc${RESET}        ${DIM}diff / diff --cached${RESET}"
  echo -e "  ${GREEN}lg/lo${RESET}        ${DIM}log graph / log oneline${RESET}"
  echo -e "  ${GREEN}last${RESET}         ${DIM}last commit stats${RESET}"
  echo ""
  echo -e "${YELLOW}Branching:${RESET}"
  echo -e "  ${GREEN}br/bra${RESET}       ${DIM}branch / branch -a${RESET}"
  echo -e "  ${GREEN}co/cob${RESET}       ${DIM}checkout / checkout -b${RESET}"
  echo -e "  ${GREEN}sw/swc${RESET}       ${DIM}switch / switch -c${RESET}"
  echo ""
  echo -e "${YELLOW}Committing:${RESET}"
  echo -e "  ${GREEN}ci${RESET}           ${DIM}commit${RESET}"
  echo -e "  ${GREEN}cia/cian${RESET}     ${DIM}amend / amend --no-edit${RESET}"
  echo ""
  echo -e "${YELLOW}Staging:${RESET}"
  echo -e "  ${GREEN}aa/ap${RESET}        ${DIM}add --all / add -p${RESET}"
  echo -e "  ${GREEN}unstage${RESET}      ${DIM}reset HEAD --${RESET}"
  echo ""
  echo -e "${YELLOW}Stashing:${RESET}"
  echo -e "  ${GREEN}sta/stap/stal${RESET}  ${DIM}stash / pop / list${RESET}"
  echo ""
  echo -e "${YELLOW}Remote:${RESET}"
  echo -e "  ${GREEN}pu/puf${RESET}       ${DIM}push / push --force-with-lease${RESET}"
  echo -e "  ${GREEN}pl/fe${RESET}        ${DIM}pull / fetch --all --prune${RESET}"
  echo ""
  echo -e "${YELLOW}Rebase:${RESET}"
  echo -e "  ${GREEN}rb/rbi${RESET}       ${DIM}rebase / rebase -i${RESET}"
  echo -e "  ${GREEN}rba/rbc${RESET}      ${DIM}abort / continue${RESET}"
  echo -e "  ${GREEN}rum${RESET}          ${DIM}rebase main@{u}${RESET}"
  echo ""
  echo -e "${YELLOW}Cleanup:${RESET}"
  echo -e "  ${GREEN}gone${RESET}         ${DIM}delete branches gone from remote${RESET}"
  echo ""
  echo -e "${BOLD}${CYAN}=== Functions ===${RESET}"
  echo ""
  echo -e "  ${GREEN}mkcd <dir>${RESET}       ${DIM}mkdir and cd into it${RESET}"
  echo -e "  ${GREEN}ff <pattern>${RESET}     ${DIM}find files by name${RESET}"
  echo -e "  ${GREEN}fd <pattern>${RESET}     ${DIM}find directories by name${RESET}"
  echo -e "  ${GREEN}killport <port>${RESET}  ${DIM}kill process on port${RESET}"
  echo -e "  ${GREEN}extract <file>${RESET}   ${DIM}extract archive${RESET}"
  echo -e "  ${GREEN}serve [port]${RESET}     ${DIM}http server (default 8000)${RESET}"
  echo -e "  ${GREEN}path${RESET}             ${DIM}show PATH entries${RESET}"
  echo -e "  ${GREEN}ip${RESET}               ${DIM}show public IP${RESET}"
  echo -e "  ${GREEN}weather [city]${RESET}   ${DIM}show weather${RESET}"
  echo -e "  ${GREEN}pullall${RESET}          ${DIM}git pull in all subdirs${RESET}"
  echo -e "  ${GREEN}pullmain${RESET}         ${DIM}checkout main & pull in all subdirs${RESET}"
  echo -e "  ${GREEN}showbranch${RESET}       ${DIM}show branch in all subdirs${RESET}"
  echo -e "  ${GREEN}nixRun <pkg>${RESET}     ${DIM}run nix package${RESET}"
  echo -e "  ${GREEN}dgrep <pattern>${RESET}  ${DIM}recursive case-insensitive grep${RESET}"
}
