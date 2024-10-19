{
  pkgs,
  prev,
}:
{
  vimPlugins = prev.vimPlugins // {
    roslyn-nvim = pkgs.callPackage ./roslyn-nvim.nix { };
  };
}
