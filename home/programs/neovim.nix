{ flake, ... }: {
  imports = [
    flake.inputs.nixvim.homeModules.nixvim
  ];
  home.sessionVariables.EDITOR = "nvim";
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavor = "mocha";
      };
    };
    opts = {
      number = true;
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
    };
    lsp.servers = {
      nixd.enable = true;
      rust_analyzer.enable = true;
    };
    plugins = {
      neo-tree.enable = true;
      web-devicons.enable = true;
      neocord.enable = true;
      neogit.enable = true;
      gitblame.enable = true;
      git-conflict.enable = true;
      wakatime.enable = true;
      rustaceanvim.enable = true;
      lspconfig.enable = true;
      lualine.enable = true;
      treesitter.enable = true;
      bufferline.enable = true;
      noice.enable = true;
      lspsaga.enable = true;
      friendly-snippets.enable = true;

      lspkind = {
        enable = true;
        cmp = {
          enable = true;
          menu = {
            nvim_lsp = "[LSP]";
            nvim_lua = "[api]";
            path = "[path]";
            luasnip = "[snip]";
            buffer = "[buffer]";
            cmp_tabnine = "[TabNine]";
          };
        };
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "luasnip"; }
        ];
      };
    };
  };
}
