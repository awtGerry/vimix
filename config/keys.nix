{ config, ... }:

let
  # For some reason does not work
  inherit (config.vimix.mkKey) mkKeymap;

  n = [
    (mkKeymap "n" "<leader>e" ":Lexplore")
  ];
in
{
  # Set de keymapps globales que no dependen de ningun plugin
  # keymaps = n;
  extraConfigLua = # lua
    ''

      vim.g.mapleader = " "
      local keymap = vim.api.nvim_set_keymap

      keymap('n', '<leader>e', '<cmd>Lexplore<cr>', {silent = true})
      keymap('n', '<C-h>', '<C-w>h', {silent = true})
      keymap('n', '<C-j>', '<C-w>j', {silent = true})
      keymap('n', '<C-k>', '<C-w>k', {silent = true})
      keymap('n', '<C-l>', '<C-w>l', {silent = true})

      keymap('v', '<', '<gv', {noremap = true, silent = true})
      keymap('v', '>', '>gv', {noremap = true, silent = true})
    '';
}
