## NeoVIM

Why am I not just using VSCode?

### I want to be able to quickly navigate between workspaces

E.g. when using docker, I'll have Dockerfiles specified in some context.
One or two directories above I'll have a Composefile.
One directory above that I'll have a Vagrantfile, some neat shell scripts
and a .github file with workflows.
There might be hundreds of files in this filetree but each file has its relative context.
I want to quickly navigate between contexts and only see what's relevant at each moment.
**I believe this will make me a more efficient programmer.**

### I want to write code FAST

Each time I take my hands off the keyboard to move a mouse I'm breaking a trance.
I'm losing the rythm to what I'm doing.
I'm leaving a world of keystrokes and commands to a world of navigating between buttons with a cursor.

**_I want to:_**

- [x] Open new tabs `ctrl-t`
- [x] Close tabs `ctrl-w`
- [x] Switch between tabs `ctrl-shift-{h,l}`
- [ ] Rotate windows CW
- [ ] Rotate windows CCW
- [x] Replace all instances of a word `:%s/word/replacement`
- [x] Incrementally replace instances of a word `:s/word/replacement/c`
- [x] Navigate to a line by writing its number `:num`
- [x] Jump n lines up or down with a single keystroke `n{j,k}`
- [x] Select n lines up or down with a single keystroke `shift-v -> n{j,k}`
- [x] Navigate to top of page `H`
- [x] Navigate to middle of page `M`
- [x] Navigate to bottom of page `L`
- [x] Navigate to top of file `gg`
- [ ] Navigate to middle of file
- [x] Navigate to bottom of file `G`
- [ ] Insert a newline below or above without entering insert mode `ctrl-{j,k}`
- [x] Insert a newline below or above, entering insert mode `{o,O}`
- [x] Enter insert mode at start of line `I`
- [ ] Enter insert mode at middle of line
- [x] Enter insert mode at end of line `A`
- [x] Comment/uncomment out selected block `<space>{cc,cu}`

### I want to have full control over extensions

In NVIM I can manually install extensions which provide some functionality.
I want to configure shortcuts and usage of said extensions manually such that they're never in my way or hard to use.

**_I want extensions to:_**

- [x] Preview .md files `markdown-preview.nvim`
- [x] Preview .puml files `markdown-preview.nvim`
- [x] Preview .tex files `vimtex`
- [x] Provide syntax highlighting `treesitter`
- [x] Provide linting `null-ls`
- [x] Provide snippets for {.tex .py .java .sh .js .jsx .html .css .puml} files `luasnip+nvim-cmp`
- [x] Offer usage of manually created snippets for specified filetypes `luasnip+nvim-cmp`
- [x] Show basic information about git repositories when applicable `gitsigns,telecope`

## Operators

| Key | Name    | Description                                               |
| --- | ------- | --------------------------------------------------------- |
| c   | change  | change selected block into whatever you type              |
| r   | replace | replace character under cursor with succeeding character  |
| x   | delete  | delete character under cursor or selection made by motion |
| i   | insert  | enter insert mode before cursor                           |
| a   | append  | enter insert mode after cursor                            |
| I   | insert  | enter insert mode before line                             |
| A   | append  | enter insert mode after line                              |

## Motions

| Key | Name      | Description                               |
| --- | --------- | ----------------------------------------- |
| w   | word      | moves cursor to beginning of next word    |
| b   | back      | moves cursor to beginning of current word |
| e   | end[word] | moves cursor to end of next word          |
| $   | end[line] | moves cursor to end of line               |
