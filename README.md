My neovim configuration
=======================

Cheat Sheet
-----------

Shortcuts:

-	`t` : open NERDTree
-	`^]` : follow the tag under cursor
-	`^t` : go back to previous tag
-	`g^]` : choose between abigous tags
-	`gf` : (sur un chemin) amène vers le fichier en question
-	`^n` : autocomplete everything
-	`^x^f` : autocomplete file names
-	`q:` : cmd history buffer (insert mode + <CR> to play command on line)

Commands:

-	`:MakeTags` : create a tags file (ctags is required)
-	`:find` : fuzzyfind a file

Templates (in `~/.config/.nvim/templates/`\):

-	`\html`
-	`\python`
-	`\clang`

TODO
----

-	tab completion (`inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"`\)

Sources
-------

-	[How to Do 90% of What Plugins Do (With Just Vim)](https://www.youtube.com/watch?v=XA2WjJbmmoM)
-	[From Vim Muggle to Wizard in 10 Easy Steps](https://www.youtube.com/watch?v=MquaityA1SM)
