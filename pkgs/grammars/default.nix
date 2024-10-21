{
  pkgs,
  prev,
}:
{
  vimPlugins = prev.tree-sitter-grammars // {
    tree-sitter-nu = pkgs.callPackage ./tree-sitter-nu.nix;
  };
}
