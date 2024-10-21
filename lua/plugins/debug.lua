return {
  'mfussenegger/nvim-dap', -- Base debugger plugin
  'rcarriga/nvim-dap-ui', -- Debuger UI
  "nvim-neotest/nvim-nio", -- Necessarry for nvim-dap-ui
  "jay-babu/mason-nvim-dap.nvim", -- Auto install dap for each languages

  'mfussenegger/nvim-jdtls', -- Java integration for nevim plugin
  { -- Rust supplementaries informations 
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true
      }
    },
  },
}
