{ lib, ... }:

with lib;

{
  options.vimix = {
    mkKey = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
  };
}
