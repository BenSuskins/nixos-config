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
    )
  done
}
