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
  echo "=== Shell Aliases ==="
  echo ""
  echo "General:"
  echo "  l            eza -lah"
  echo "  ls           eza"
  echo "  tree         eza --tree --git-ignore"
  echo "  cat          bat"
  echo ""
  echo "Navigation:"
  echo "  ../.../..... go up 1/2/3 dirs"
  echo "  cdr          cd to git root"
  echo ""
  echo "Shortcuts:"
  echo "  g            lazygit"
  echo ""
  echo "Utility:"
  echo "  copy/paste   pbcopy/pbpaste"
  echo "  ports        show listening ports"
  echo ""
  echo "Nix:"
  echo "  nixconfig    open nix config"
  echo "  nixclean     garbage collect"
  echo "  rebuild      darwin-rebuild build"
  echo "  switch       darwin-rebuild switch"
  echo "  compare      diff closures"
  echo ""
  echo "SSH:"
  echo "  sshmedia, sshdocker, sshgame, sshmonitor, sshdevelopment"
  echo ""
  echo "=== Git Aliases (git <alias>) ==="
  echo ""
  echo "Status & Info:"
  echo "  st/ss        status / status -s"
  echo "  di/dc        diff / diff --cached"
  echo "  lg/lo        log graph / log oneline"
  echo "  last         last commit stats"
  echo ""
  echo "Branching:"
  echo "  br/bra       branch / branch -a"
  echo "  co/cob       checkout / checkout -b"
  echo "  sw/swc       switch / switch -c"
  echo ""
  echo "Committing:"
  echo "  ci           commit"
  echo "  cia/cian     amend / amend --no-edit"
  echo ""
  echo "Staging:"
  echo "  aa/ap        add --all / add -p"
  echo "  unstage      reset HEAD --"
  echo ""
  echo "Stashing:"
  echo "  sta/stap/stal  stash / pop / list"
  echo ""
  echo "Remote:"
  echo "  pu/puf       push / push --force-with-lease"
  echo "  pl/fe        pull / fetch --all --prune"
  echo ""
  echo "Rebase:"
  echo "  rb/rbi       rebase / rebase -i"
  echo "  rba/rbc      abort / continue"
  echo "  rum          rebase main@{u}"
  echo ""
  echo "Cleanup:"
  echo "  gone         delete branches gone from remote"
  echo ""
  echo "=== Functions ==="
  echo ""
  echo "  mkcd <dir>       mkdir and cd into it"
  echo "  ff <pattern>     find files by name"
  echo "  fd <pattern>     find directories by name"
  echo "  killport <port>  kill process on port"
  echo "  extract <file>   extract archive"
  echo "  serve [port]     http server (default 8000)"
  echo "  path             show PATH entries"
  echo "  ip               show public IP"
  echo "  weather [city]   show weather"
  echo "  pullall          git pull in all subdirs"
  echo "  pullmain         checkout main & pull in all subdirs"
  echo "  showbranch       show branch in all subdirs"
  echo "  nixRun <pkg>     run nix package"
  echo "  dgrep <pattern>  recursive case-insensitive grep"
}
