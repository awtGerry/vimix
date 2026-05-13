# Archivo que contiene funciones basicas utilizadas en las configs
{ lib, ... }:
{
  vimix.mkKey = rec {
    mkKeymap = mode: key: action: desc: {
      inherit mode key action;
      options = {
        inherit desc;
        silent = true;
        noremap = true;
        remap = true;
      };
    };
  };
}
