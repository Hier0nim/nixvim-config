{
  fetchFromGitHub,
  buildGrammar,
}:
buildGrammar {
  language = "norg_meta";
  version = "0.0.0+6f0510c";
  src = fetchFromGitHub {
    owner = "nvim-neorg";
    repo = "tree-sitter-norg-meta";
    rev = "6f0510cc516a3af3396a682fbd6655486c2c9d2d";
  };
  meta.homepage = "https://github.com/nvim-neorg/tree-sitter-norg-meta";
}
