dgrep() {
  # A recursive, case-insensitive grep that excludes binary files
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