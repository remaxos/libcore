""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is Marian Rotariu's .vimrc file. It should work together with the
" .gvimrc file.
"
" The added plugins:
" * Pathogen
"   Info: a plugin manager; it seems that all the recent plugins are integrated
"	  with pathogen; everything looks smoothly
"   Link: http://www.vim.org/scripts/script.php?script_id=2332
"   Git: https://github.com/tpope/vim-pathogen
"
" * Cscope (crucial for code navigation in large projects)
"   Info: self-explanatory
"   Link: TODO
"   Git: TODO
"   Runtime Tool: sudo apt-get install cscope
"   Additional Info: cscope is a separate and independent tool. Gvim has an
"   interface to integrate the important database generate by cscope.
"   Dependencies: TODO
"
" * NERDtree
"   Info: showing directory structures
"   Link: -
"   Git: https://github.com/scrooloose/nerdtree
"
" * Fugitive
"   Info: git integration into vim
"   Link: https://github.com/tpope/vim-fugitive
"   Vim Link: http://www.vim.org/scripts/script.php?script_id=2975
"   Git: git://github.com/tpope/vim-fugitive.git
"   Additional Info: It is integrated with Pathogen, so nothing left to do
"
" * Vim-notes
"   Info: interface for taking notes
"   Link: http://peterodding.com/code/vim/notes/
"   Vim Link: http://www.vim.org/scripts/script.php?script_id=3375
"   Git: https://github.com/xolox/vim-notes
"   Dependencies: Vim-misc (below)
"
" * Exuberant Ctags
"   Info: prints the contents (it needs exuberant_ctags)
"   Link: http://ctags.sourceforge.net/
"   Debian Link: https://packages.debian.org/jessie/exuberant-ctags
"   Vim Link: 
"
" * Taglist
"   Info: prints the contents (it needs exuberant_ctags); it is one of the most
"	  useful vim plugin
"   Vim Link: http://www.vim.org/scripts/script.php?script_id=273
"
" * Syntastic
"   Info: syntax checker " 
"   Link: http://vimawesome.com/plugin/syntastic "
"   Vim Link: http://www.vim.org/scripts/script.php?script_id=2736
"
" * Solarized
"   Info: colorscheme
"   Link1: http://ethanschoonover.com/solarized
"   Link2: http://vimawesome.com/plugin/vim-colors-solarized-sparks-fly
"   Vim Link: http://www.vim.org/scripts/script.php?script_id=2736
"   
" * Bitbake (inactive)
"   Info: color highlighting for bitbake syntax
"   Link: N/A
"
" * Vim-misc
"   Info: TODO
"   Vim Link:
"   Web Link:
"   Git:
"   Dependencies: -
"
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
" Future interesting plugins:
" 1. _clang_
" 2. _gccsense_
" 3. nerdtree-execute
" 	Might be useful sometimes
"
" Future interesting stuff:
" 1. _quickfix_ (included in vim; not a plugin)
" 2. :make (automatic build; something about in _quickfix_)
"
" Sources 
" http://vimawesome.com
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""
" General settings
"""""""""""""""""""""""""
set number
" set textwidth=80  "This is very annoying, especially if not a kernel programming
set ignorecase
set hlsearch
set incsearch
" set cindent "alternatives: smartindent, autoindent
" set expandtab 			"adds spaces for tabs 
" set tabstop=2
" set shiftwidth=4
" set cinkeys=0{,0},:,0#,!,!^F

"""""""""""""""""""""""""
" Pathogen configuration
"""""""""""""""""""""""""
execute pathogen#infect()
echo "pathogen infected"

""""""""""""""""""""""""
" NERDTree configuration
""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
map <F4> :NERDTreeToggle<cr>
echo "nerdtree configured"

""""""""""""""""""""""""
" Solarized
""""""""""""""""""""""""
syntax enable
"set background=dark
set background=light
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Taglist + Exuberant Ctags
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Create a ctags file with:
"		ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
" some of the above arguments are needed for omnicppcompletion
" some of them are not needed for c files, but only for c++

":TlistAddFiles ~/linux-devel/tags		"work only
" set tags+=/work/tags
map <F3> :TlistToggle<cr>

" Did not manage to install exuberant_tags from source
" The good news is that it is supported through debian packages.
" Try: sudo apt-get install exuberant-ctags
" let Tlist_Show_One_File = 1  "read doc/taglist.txt for more details
echo "taglist configured"

"""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
echo "syntastic configured"

""""""""""""""""""""""""""
" Cscope configuration
""""""""""""""""""""""""""
"
" Build the cscope database command:
cscope -b -q -k -R

" Freescale manual database addition (obsolete)
"cs add /homedir/b44860/dpaa/cscope.out /homedir/b44860/dpaa

" Mentor manual database addition
"cs add /home/mrotariu/linux-ti-glsdk/cscope.out /home/mrotariu/linux-ti-glsdk
"echo "linux database added"
"cs add /home/mrotariu/mtd-utils/cscope.out
"echo "mtd-utils database added"

" Problem: the cscope database is built with relative paths
" Solution: http://stackoverflow.com/questions/2188405/how-to-let-cscope-use-absolute-path-in-cscope-out-file
"
" This file contains some boilerplate settings for vim's cscope interface,
" plus some keyboard mappings that I've found useful.
"
" USAGE: 
" -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
"               'plugin' directory in some other directory that is in your
"               'runtimepath'.
"
" -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
"               your ~/.vimrc file (or cut and paste it into your .vimrc).
"
" NOTE: 
" These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
" keeps timing you out before you can complete them, try changing your timeout
" settings, as explained below.
"
" Happy cscoping,
"
" Jason Duell       jduell@alumni.princeton.edu     2002/3/7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim... 
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    "add any cscope database in current directory
    if filereadable("cscope.out")
       cs add cscope.out  
    "else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
         cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    " set cscopeverbose  

    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

    nmap <C-[>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-[>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-[>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-[>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-[>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-[>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-[>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-[>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-[><C-[>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[><C-[>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[><C-[>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[><C-[>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[><C-[>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[><C-[>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-[><C-[>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-[><C-[>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif
