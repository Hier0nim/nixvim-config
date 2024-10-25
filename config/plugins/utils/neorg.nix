{
  keymaps = [
    {
      key = "<leader>ni";
      action = "<CMD>Neorg index<CR>";
    }
  ];
  plugins.neorg = {
    enable = true;
    modules = {
      "core.defaults" = {
        __empty = null;
      };
      "core.concealer" = {
        __empty = null;
      };
      "core.dirman" = {
        config = {
          default_workspace = "SecondBrain";
          workspaces = {
            SecondBrain = "~/SecondBrain";
          };
        };
      };
    };
  };
}
