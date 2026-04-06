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
  imports = [
    imports
  ];
}
