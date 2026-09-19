-- Colorschemes: Catppuccin (Frappé is the favorite) + Gruvbox
-- Deployed into ~/.config/nvim/lua/plugins/ by editor-install.sh.
--
-- Switch on the fly with `:colorscheme <name>`:
--   catppuccin-frappe   catppuccin-mocha   catppuccin-macchiato   catppuccin-latte
--   gruvbox
-- Or browse them live with `<leader>uC`.
return {
  -- Catppuccin — Frappé flavor
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "frappe", -- latte, frappe, macchiato, mocha
    },
  },

  -- Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      contrast = "medium", -- soft, medium, hard
    },
  },

  -- Make Catppuccin Frappé the default theme LazyVim loads at startup.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },
}
