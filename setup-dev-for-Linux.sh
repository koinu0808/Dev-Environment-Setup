#!/bin/bash
set -e

echo "========== Dev Environment Setup =========="

# ------------------- 1. Install dependencies -------------------
echo "Installing unzip and curl..."
sudo apt update
sudo apt install -y unzip curl git vim

# ------------------- 2. Install Oh My Posh -------------------
echo "Installing Oh My Posh..."
curl -s https://ohmyposh.dev/install.sh | bash -s

# Add Oh My Posh to PATH
grep -qxF 'export PATH=$HOME/.local/bin:$PATH' ~/.bashrc || \
    echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc
export PATH=$HOME/.local/bin:$PATH

# Verify installation
oh-my-posh --version

# ------------------- 3. Install atomic theme -------------------
echo "Installing atomic theme for Oh My Posh..."
mkdir -p ~/.poshthemes
curl -L https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/atomic.omp.json \
    -o ~/.poshthemes/atomic.omp.json

# Add theme initialization to bashrc
grep -qxF 'eval "$(oh-my-posh init bash --config ~/.poshthemes/atomic.omp.json)"' ~/.bashrc || \
    echo 'eval "$(oh-my-posh init bash --config ~/.poshthemes/atomic.omp.json)"' >> ~/.bashrc

source ~/.bashrc

# ------------------- 4. Install Vim-plug -------------------
echo "Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ------------------- 5. Setup Vim configuration -------------------
echo "Setting up Vim configuration..."
cat > ~/.vimrc << 'EOF'
" --- vim-plug 開始 ---
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
" --- vim-plug 結束 ---

" Airline 設定
let g:airline_theme='atomic'
let g:airline_powerline_fonts = 1

" 狀態列欄位（必須在 plug#end() 後面）
if exists('*airline#section#create')
  let g:airline_section_a = airline#section#create(['mode'])
  let g:airline_section_b = airline#section#create(['branch'])
  let g:airline_section_c = airline#section#create(['filename'])
  let g:airline_section_x = airline#section#create(['filetype'])
  let g:airline_section_y = airline#section#create(['percent'])
  let g:airline_section_z = airline#section#create(['location'])
endif
EOF

# ------------------- 6. Install Vim plugins -------------------
echo "Installing Vim plugins..."
vim +PlugInstall +qall

echo "========== Setup Complete =========="
echo "Restart your terminal to see Oh My Posh atomic theme."
echo "Open Vim to see atomic theme via vim-airline."
echo "已下載完成，如有顯示問題，請使用字體 FiraCode Nerd Font Mono"
echo "感謝你的使用"