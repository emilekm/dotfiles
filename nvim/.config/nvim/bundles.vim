silent exec '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

" Plugins {
    call plug#begin(stdpath('data') . '/plugged')

    " Common {
        Plug 'tpope/vim-sensible'
        Plug 'editorconfig/editorconfig-vim'

        if has('nvim')
          Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        else
          Plug 'Shougo/deoplete.nvim'
          Plug 'roxma/nvim-yarp'
          Plug 'roxma/vim-hug-neovim-rpc'
        endif

        Plug 'scrooloose/nerdtree'
        Plug 'tpope/vim-commentary'
        Plug 'nathanaelkane/vim-indent-guides'

        Plug 'tpope/vim-repeat'
        " Plug 'svermeulen/vim-easyclip'
        " Plug 'mattn/webapi-vim'
        " Plug 'mattn/gist-vim'
        " Plug 'majutsushi/tagbar'
    " }

    " Ansible {
    	Plug 'pearofducks/ansible-vim'
    " }
    "
    " Go {
        Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    " }

    " Javascript {
        Plug 'pangloss/vim-javascript'
    " }

    " Markdown {
        Plug 'godlygeek/tabular'
        Plug 'plasticboy/vim-markdown'
    " }

    " Python {
        Plug 'jmcantrell/vim-virtualenv'
    " }

    " Style {
        Plug 'kaicataldo/material.vim'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'powerline/fonts'
        Plug 'ryanoasis/vim-devicons'
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    " }

    call plug#end()
" }


" Configuration {
    " Common {
        let g:deoplete#enable_at_startup = 1

        let g:indent_guides_enable_on_vim_startup = 1

        map <leader>e :NERDTreeToggle<CR>
    " }

    " Style {
	" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
	" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
	" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
	if (has('termguicolors'))
	  set termguicolors
	endif
        colorscheme material
        let g:airline_theme = 'material'
    " }
"
" }

