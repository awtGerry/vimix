# WARNING: Este archivo hace que se filtren todos los archivos .nix del tree, lo que significa
# que cualquier archivo sera utilizado, esto evita la entrada manual de imports pero puede romper
# el programa cuando se agregue una nueva configuracion si esta no esta probada con anterioridad.

let
  f = builtins.readDir ./.;
  # Filtrar este archivo y todos los archivos que no sean .nix
  nxf = builtins.filter (name: name != "default.nix" && builtins.match ".*\\.nix" name != null) (
    builtins.attrNames f
  );
  # Enlista los archivos para su importe
  imports = map (name: ./. + "/${name}") nxf;

  # Los plugins si me gustaria editarlos como "modulos" ya que estos tienden a cambiar con el paso
  # del tiempo y no quiero que esto rompa el programa, por lo que su actualizacion sera de forma manual
  # asi mismo su import para acceso rapido (basicamente borrar el importe si no hay un fix rapido para
  # el plugin)
  # modules = [
  # ];
in
{
  imports = imports;

  # Top-level error de opts
  extraConfigLua = # lua
    ''
      vim.cmd [[
        autocmd BufRead,BufNewFile *.html,*md,*.js,*.ts,*.svelte,*.tsx,*.css,*.php,*.json,*.nix,*.gleam setlocal tabstop=2 shiftwidth=2 softtabstop=2
        autocmd BufRead,BufNewFile *.php set autoindent
      ]]
          
      vim.cmd [[
          au BufWinEnter * set formatoptions-=c formatoptions-=r formatoptions-=o
          au BufRead * set formatoptions-=c formatoptions-=r formatoptions-=o
          au BufNewFile * set formatoptions-=c formatoptions-=r formatoptions-=o
      ]]
    '';
}
