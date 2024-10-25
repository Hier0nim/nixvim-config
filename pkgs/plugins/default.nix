{
  pkgs,
  prev,
}:
{
  vimPlugins = prev.vimPlugins {
    roslyn-nvim = pkgs.callPackage ./roslyn-nvim.nix { };
    nabla-nvim = pkgs.callPackage ./nabla-nvim.nix { };
  };
}
