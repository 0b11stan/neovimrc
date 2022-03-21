My neovim configuration
=======================

Dependancies
------------

```bash
cat Dockerfile | grep -A1 pacman | tail -n 1
```

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
-	`\c` : highlight column and not line
-	`MV` : go to ~/.config/nvim/init.vim

Marks:

-	`Mx` : set a mark (uppercase is global, lowercase is filebased)
-	\``x` : use a mark

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
-	fix back to start of file on format
-	feat maketags on format
-	fix implement comment en multiple languages
-	watch and use source 2
-	read and use source 3
-	read and use source 4

Sources
-------

1.	[How to Do 90% of What Plugins Do (With Just Vim)](https://www.youtube.com/watch?v=XA2WjJbmmoM)
2.	[From Vim Muggle to Wizard in 10 Easy Steps](https://www.youtube.com/watch?v=MquaityA1SM)
3.	[Using marks](https://vim.fandom.com/wiki/Using_marks)
4.	[Learn Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com/)
