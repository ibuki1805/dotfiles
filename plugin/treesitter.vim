lua<<EOF
require 'nvim-treesitter.configs'.setup{
  highlight = {
    enable = true,  -- enable sysntax highlighting
    disable = { -- disable syntax highlighting for some languages
    },
  },
  ensure_installed = 'all', -- :same as TSInstall all
  -- ensure_installed = 'maintained',
}
EOF
