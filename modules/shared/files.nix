{ hostRole }:

{
  ".local/bin/idea" = {
    source = ../../programs/idea/${hostRole}/idea;
    executable = true;
  };
}