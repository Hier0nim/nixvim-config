{
  vimUtils,
  fetchFromGitHub,
}:
vimUtils.buildVimPlugin {
  name = "R.nvim";
  src = fetchFromGitHub {
    owner = "R-nvim";
    repo = "R.nvim";
    rev = "0115feed3f84b834899b6fa059a7730f318b9523";
    hash = "sha256-LFN0ms1L7HCj71k1P2t5DVon3z3VaPze0YWmnMQZ9oM=";
  };
  meta.homepage = "https://github.com/R-nvim/R.nvim";
}
