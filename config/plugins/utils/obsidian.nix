{
  plugins.obsidian = {
    enable = true;
    settings = {
      workspaces = [
        {
          name = "SecondBrain";
          path = "~/Projects/Personal/SecondBrain";
        }
      ];
      templates = {
        subdir = "templates";
        dateFormat = "%Y-%m-%d";
        timeFormat = "%H:%M";
        substitutions = { };
      };

      dailyNotes = {
        folder = "0_Daily_Notes";
        dateFormat = "%Y-%m-%d";
        aliasFormat = "%B %-d, %Y";
      };
    };
  };
}
