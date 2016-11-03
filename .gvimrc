""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is Marian Rotariu .gvimrc file. Don't know if this
" works on vi also as a .vimrc file. 
" The added plugins:
" 1. _cscope_ (crucial for code navigation in large projects)
"    some mappings are created in the following lines; It is included by default
"    in most linux distribution packages. Therefore, you can fetch it by the
"    the package manager;
" 4. _omnicppcomplete_ (autocompletes structures; needs _exuberant_ctags_)
" 5. _errors_ (some syntax checking)
" 6. Vertigo
" 	Makes vertical jumps in source files easier
" 7. locate (MUST HAVE)
" 	Searching tool a little more powerful. You can still have old vim
" 	search in the same time. Two search capabilities in the same time.
" 8. vim-airline
" 	A sweet status line
"
" Color schemes:
" 1. visualstudio
" 	This has a neat output but uses wider fonts; only for widescreens
" 2. eclipse
" 	Recommended by Bogdan Hamciuc and has a robust appearance
"
" * Solarized
"   Info: colorscheme
"   Link1: http://ethanschoonover.com/solarized
"   Link2: http://vimawesome.com/plugin/vim-colors-solarized-sparks-fly
"   Vim Link: http://www.vim.org/scripts/script.php?script_id=2736
"
" Future interesting plugins:
" 1. _clang_
" 2. _gccsense_
" 3. nerdtree-execute
" 	Might be useful sometimes
"
" Future interesting stuff:
" 1. _quickfix_ (included in vim; not a plugin)
" 2. :make (automatic build; something about in _quickfix_)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Activate plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""
"set nocp	"nocompatible (dont know what it's doing)

" set modeline	"modelines are lines that can be added to a text file that tell Vim how it should behave when started, altering standard Vim behavior in some way.
		"(see http://www.techrepublic.com/blog/security/turn-off-modeline-support-in-vim/4476)

" Filetypes
""""""""""""""""""""""""""""
" filetype on	"Vim can detect the type of file that is edited.  This is done by checking the
		"file name and sometimes by inspecting the contents of the file for specific
		"text.
" filetype plugin on "needed for omnicppcompletion
""""""""""""""""""""""""""""

set autowrite	"see help page (pretty self-explanatory)
set wildmenu	"see help page

"""""""""""""""""""""""""""""""
" Status line
"""""""""""""""""""""""""""""""
" set laststatus=2
" set statusline=%<%f\ %y%h%m%r%=%-24.(0x%02B,%l/%L,%c%V%)\ %P
"""""""""""""""""""""""""""""""

""""""""""""""""""""""""
" Solarized
""""""""""""""""""""""""
syntax enable
" sometimes I prefer the standard, quiet colorscheme (so peaceful!)
"set background=dark
"set background=light
"colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the size of the window in GUI (gvim only)
""""""""""""""""""""""""""""""""""""""""""""""""""
" set lines=80 columns=200 "large values just to enter fullscreen
" set scrolloff=5

"""""""""""""""""""""""""""""""""""""""""""""""""
" Set the colorscheme; This will overwrite the .vimrc settings
" Sometimes, the GVIM scheme is hideous in VIM therefore we need different
" colorscheme for the two


""""""""""""""""""""""""""""""""""""""""""""""""""
" Some general settings (GVIM)
""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=Monospace\ 10

""""""""""""""""""""""""""""""""""""""
" System Clipboard
""""""""""""""""""""""""""""""""""""""
"map <F5> "+gP 
"map <F6> "+y


"""""""""""""""""""""""""""""""""""""""""""""""""""
" Soni-Template 
"""""""""""""""""""""""""""""""""""""""""""""""""""
" map <F2> :Template 

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Column (this is available only for vim 7.3)
""""""""""""""""""""""""""""""""""""""""""""""""""
" match ErrorMsg /\%>80v.\+/
" autocmd BufWinEnter * call matchadd('ErrorMsg', '\%>'.&l:textwidth.'v.\+', -1)

""""""""""""""""""""""""""""""""""""""""""""""""""""
" OmniCompletion (Intellisense) 
""""""""""""""""""""""""""""""""""""""""""""""""""""
" set ofu=syntaxcomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""
" OmniCppComplete (different from OmniCompletion)
""""""""""""""""""""""""""""""""""""""""""""""""""""
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_DisplayMode = 0
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Errors 
""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <F5> :Errors<cr> "F5 is now mapped with copy to clipboard

"""""""""""""""""""""""""""
" Code Comenter
""""""""""""""""""""""""""

""""""""""""""""""""""""""
" Source Explorer
""""""""""""""""""""""""""
" // The switch of the Source Explorer
" nmap <F8> :SrcExplToggle<CR>

" // Set the height of Source Explorer window
" let g:SrcExpl_winHeight = 8

" // Set 100 ms for refreshing the Source Explorer
" let g:SrcExpl_refreshTime = 100

" // Set "Enter" key to jump into the exact definition context
" let g:SrcExpl_jumpKey = "<ENTER>"

" // Set "Space" key for back from the definition context
" let g:SrcExpl_gobackKey = "<SPACE>"

" // In order to Avoid conflicts, the Source Explorer should know what plugins
" // are using buffers. And you need add their bufname into the list below
" // according to the command ":buffers!"
" let g:SrcExpl_pluginList = [
"        \ "__Tag_List__",
"        \ "_NERD_tree_",
"        \ "Source_Explorer"
"    \ ]

" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
" let g:SrcExpl_searchLocalDef = 1

" // Do not let the Source Explorer update the tags file when opening
" let g:SrcExpl_isUpdateTags = 0

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" //  create/update a tags file
" let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."

" // Set "<F12>" key for updating the tags file artificially
" let g:SrcExpl_updateTagsKey = "<F12>" 


"""""""""""""""""""""""""""""""""""""""""""""
" C Standard Highlight
""""""""""""""""""""""""""""""""""""""""""""
"let c_syntax_for_h = 1
"let c_C94 = 1
"let c_C99_warn = 1
"let c_cpp_warn = 1
"let c_warn_8bitchars = 1
"let c_warn_multichar = 1
"let c_warn_digraph = 1
"let c_warn_trigraph = 1
"let c_no_octal = 1

"let c_comment_strings = 1
"let c_comment_numbers = 1
"let c_comment_types = 1
"let c_comment_date_time = 1

"let c_no_names = 1 
"let c_space_errors = 1

"""""""""""""""""""""""""""""""""""""""""""""""
" Vertigo
"""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <silent> <Space>j :<C-U>VertigoDown n<CR>
"vnoremap <silent> <Space>j :<C-U>VertigoDown v<CR>
"onoremap <silent> <Space>j :<C-U>VertigoDown o<CR>
"nnoremap <silent> <Space>k :<C-U>VertigoUp n<CR>
"vnoremap <silent> <Space>k :<C-U>VertigoUp v<CR>
