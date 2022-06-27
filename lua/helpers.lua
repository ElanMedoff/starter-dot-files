function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, {noremap = true, silent = true})
end

function nmap(shortcut, command)
  map("n", shortcut, command)
end

function imap(shortcut, command)
  map("i", shortcut, command)
end

function vmap(shortcut, command)
  map("v", shortcut, command)
end

local helpers = {
  cmd = vim.cmd,
  set = vim.opt,
  let = vim.g,
  nmap = nmap,
  imap = imap,
  vmap = vmap,
  map = vim.api.nvim_set_keymap
}
return helpers
