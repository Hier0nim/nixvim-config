{
  plugins.which-key = {
    enable = true;
    settings = {
      preset = "helix";
      spec = [
        {
          __unkeyed = "<leader>c";
          group = "Code";
          mode = [
            "n"
            "v"
          ];
        }
        {
          __unkeyed = "<leader>g";
          group = "Git";
          mode = [
            "n"
          ];
        }
        {
          __unkeyed = "<leader>f";
          group = "Find";
          mode = [
            "n"
          ];
        }
        {
          __unkeyed = "<leader>m";
          group = "Markdown";
          mode = [
            "n"
          ];
        }
        {
          __unkeyed = "<leader>q";
          group = "Session";
          mode = [
            "n"
          ];
        }
        {
          __unkeyed = "<leader>s";
          group = "Search";
          mode = [
            "n"
          ];
        }
        {
          __unkeyed = "<leader>u";
          group = "UI";
          mode = [
            "n"
          ];
        }
        {
          __unkeyed = "<leader>w";
          group = "Window";
          mode = [
            "n"
          ];
        }
      ];
    };
  };
}
