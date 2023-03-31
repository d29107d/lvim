lvim.builtin.lualine.options = {
  icons_enabled = true,
  theme = 'auto',
  component_separators = { left = '', right = ''},
  section_separators = { left = '', right = ''},
  disabled_filetypes = {
    statusline = {},
    winbar = {},
  },
  ignore_focus = {},
  always_divide_middle = true,
  globalstatus = false,
  refresh = {
    statusline = 1000,
    tabline = 1000,
    winbar = 1000,
  }
}

lvim.builtin.lualine.sections = {
  lualine_a = {'mode'},
--    lualine_b = {'branch', 'diff', 'diagnostics'},
  lualine_b = {'diagnostics'},
  lualine_c = {{ 'filename', path = 1 }},
  lualine_x = {'encoding', 'fileformat', 'filetype'},
  lualine_y = {'progress'},
  lualine_z = {'location'}
}

lvim.builtin.lualine.inactive_sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {'filename'},
  lualine_x = {'location'},
  lualine_y = {},
  lualine_z = {}
}

lvim.builtin.lualine.tabline = {}
lvim.builtin.lualine.winbar = {}
lvim.builtin.lualine.inactive_winbar = {}
lvim.builtin.lualine.extensions = {}
