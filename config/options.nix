{
  config.opts = {
    # Configuracion basica
    belloff = "all"; # Ni idea si sigue siendo necesario
    number = true;
    relativenumber = true;
    scrolloff = 10;
    showmode = false; # Quita los modos 'INSERT', 'VISUAL', etc
    signcolumn = "yes";
    cursorline = true;
    wrap = false;
    hidden = true; # Deja los buffer abiertos (+ RAM pero worth)
    # clipboard = "unnamedplus"; # comparte clipboard con vim y el sistema
    shortmess = "c";
    mouse = "";

    # Busqueda
    incsearch = true;
    hlsearch = false;
    ignorecase = true;
    smartcase = true;

    wildmode = "longest:full";
    wildoptions = "pum";

    tabstop = 4;
    softtabstop = 4;
    shiftwidth = 4;

    smartindent = true; # Tab iniciando nueva linea
    expandtab = true; # En modo INSERT usa el numero correcto de espacios

    # Ventanas
    equalalways = false; # Las pantallas divididas siempre tendran el mismo tamano
    splitright = true; # Cuando hay una nueva ventana mandarla a la derecha (:vsplit)
    splitbelow = true; # Lo mismo pero hacia abajo (:split)

    undofile = true;
    swapfile = false;
    backup = false;
  };

  extraConfigLua = ''
    vim.cmd [[
      autocmd BufRead,BufNewFile *.html,*md,*.js,*.ts,*.svelte,*.tsx,*.css,*.php,*.json,*.nix,*.gleam setlocal tabstop=2 shiftwidth=2 softtabstop=2
      autocmd BufRead,BufNewFile *.php set autoindent
    ]]
  '';
}
