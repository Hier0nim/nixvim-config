{
  vimUtils,
  fetchFromGitHub,
}:
vimUtils.buildVimPlugin {
  name = "nabla";
  src = fetchFromGitHub {
    owner = "jbyuki";
    repo = "nabla.nvim";
    rev = "27a6ea9ed7452bb9e0b19eb0942b5bcf7d051b2f";

    hash = "sha256-4M2IFzgJupw7bUqdDqoAhZOgW96BeowjhbHzpYw2zbY=";
  };
  meta.homepage = "https://github.com/jbyuki/nabla.nvim";
}
