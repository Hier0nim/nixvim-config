{
  vimUtils,
  fetchFromGitHub,
}:
vimUtils.buildVimPlugin {
  name = "roslyn.nvim";
  src = fetchFromGitHub {
    owner = "seblj";
    repo = "roslyn.nvim";
    rev = "0cb7527d951237bd23e30c461e8f7e2d615830fd";
    hash = "sha256-t3gShqWD54bUPOAsqF+VeUenbuFtFxk3fpz8mVRASEw=";
  };
  meta.homepage = "https://github.com/seblj/roslyn.nvim";
}
