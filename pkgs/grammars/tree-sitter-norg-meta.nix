{
  fetchFromGitHub,
  pkgs,
}:
pkgs.tree-sitter.buildGrammar {
  language = "norg_meta";
  version = "0.0.0+6f0510c";
  src = fetchFromGitHub {
    owner = "nvim-neorg";
    repo = "tree-sitter-norg-meta";
    rev = "6f0510cc516a3af3396a682fbd6655486c2c9d2d";
    hash = "sha256-8qSdwHlfnjFuQF4zNdLtU2/tzDRhDZbo9K54Xxgn5+8=";
  };
  meta.homepage = "https://github.com/nvim-neorg/tree-sitter-norg-meta";
}
