{
  vimUtils,
  fetchFromGitHub,
}:
vimUtils.buildVimPlugin {
  name = "log-highlight.nvim";
  src = fetchFromGitHub {
    owner = "fei6409";
    repo = "log-highlight.nvim";
    rev = "cd948cad8150475ac1ace5515d0ae206a9aad3f2";
    hash = "sha256-cD7fcMicLhuu+65PU6hXq+aaNjb+c+lVIGyMMRmNvww=";
  };
  meta.homepage = "https://github.com/fei6409/log-highlight.nvim";
}
