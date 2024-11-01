{
  plugins = {
    auto-session = {
      enable = true;
      settings = {
        autoRestore = true;
        autoSession.suppressDirs = [
          "~/"
          "~/Downloads"
          "~/Documents"
        ];
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>qr";
      action = "<cmd>SessionRestore<CR>";
      options = {
        silent = true;
        desc = "Restore session for cwd";
      };
    }
    {
      mode = "n";
      key = "<leader>qs";
      action = "<cmd>SessionSave<CR>";
      options = {
        silent = true;
        desc = "Save session for auto session root dir";
      };
    }
    {
      mode = "n";
      key = "<leader>ql";
      action = "<cmd>Autosession search<CR>";
      options = {
        silent = true;
        desc = "List Session";
      };
    }
    {
      mode = "n";
      key = "<leader>qd";
      action = "<cmd>Autosession delete<CR>";
      options = {
        silent = true;
        desc = "Delete Session";
      };
    }
    {
      mode = "n";
      key = "<leader>qD";
      action = "<cmd>SessionPurgeOrphaned<CR>";
      options = {
        silent = true;
        desc = "Purge Orphaned Sessions";
      };
    }
  ];
}
