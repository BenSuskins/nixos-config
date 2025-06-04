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
