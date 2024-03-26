# shell.nix

{ pkgs, ... }:

with pkgs;

mkShell {
  buildInputs = [
    # Packages from home.packages
    kitty
    dotacat
    cowsay
    fortune-kind
    starship

    # Other packages you may need in your shell environment
    zsh
    bash
    tmux
    neovim
  ];

  shellHook = ''
    # Additional shell configuration or setup commands can go here
    export EDITOR="nvim"
    export TERM="xterm-256color"
    # Add any other environment variables or setup commands as needed
  '';

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    autocd = true;
  };

  programs.bash = {
    enable = true;
    enableAutosuggestions = true;
    autocd = true;
  };

  programs.tmux = {
    enable = true;
    shell = "\${pkgs.zsh}/bin/zsh";
  };

  programs.neovim = {
    enable = true;
    extraConfig = ''
      " General
      syntax on
      set number
      set tabstop=2
      set softtabstop=2
      set shiftwidth=2
      set expandtab
      set autoindent
      set smartindent
      set smarttab
      set mouse=a
      set clipboard=unnamedplus
      set incsearch
      set hlsearch
      set ignorecase
      set smartcase
      set lazyredraw
      set linebreak
      set breakindent
      set nolist
      set showmatch
      set cursorline
      set laststatus=2
      set noshowmode
      set wrap
      set wrapmargin=0
      set nowrapscan
      set scrolloff=1
      set completeopt=menuone,noinsert,noselect
      set updatetime=500
      set timeoutlen=1000
      set hidden
      set splitbelow
      set splitright

      " FZF
      set rtp+=~/.fzf
      command! -bang -nargs=* Fzf call fzf#vim#run({'source': 'rg --files --hidden --glob "!.git/*"', 'sink': 'e', 'down': '40%'})
      nnoremap <leader>p :Fzf<cr>
    '';
  };
}
