{
  pkgs,
  prev,
}:
{
  vimPlugins = prev.vimPlugins // {
    roslyn-nvim = pkgs.callPackage ./plugins/roslyn-nvim.nix { };
    nabla-nvim = pkgs.callPackage ./plugins/nabla-nvim.nix { };
    r-nvim = pkgs.callPackage ./plugins/r-nvim.nix { };
    cmp-r = pkgs.callPackage ./plugins/cmp-r.nix { };
    log-highlight = pkgs.callPackage ./plugins/log-highlight.nix { };
  };

  tree-sitter-grammars = prev.tree-sitter-grammars // {
    tree-sitter-nu = pkgs.callPackage ./grammars/tree-sitter-nu.nix { };
    tree-sitter-norg-meta = pkgs.callPackage ./grammars/tree-sitter-norg-meta.nix { };
  };
}
