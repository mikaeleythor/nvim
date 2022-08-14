## NeoVIM

Why am I not just using VSCode?

### I want to be able to quickly navigate between workspaces

E.g. when using docker, I'll have Dockerfiles specified in some context. One or two directories above I'll have a Composefile. One directory above that I'll have a Vagrantfile, some neat shell scripts and and a .github file with workflows. There might be hundreds of files in this filetree but each file has its relative context. I want to quickly navigate between contexts and only see what's relevant at each moment. **I believe this will make me a more efficient programmer.** This is achieveble with the NERDTree extension which allows me to move up and down directories quickly and to preview and view multiple files with vertical or horizontal split.

***With NERDTree I want to:***
- [x] Navigate to the parent directory with one command `u`
- [ ] Navigate the 'cursor' to a file/folder by writing its name
- [x] Open a file, vertically splitting the last selected node `s`
- [x] Open a file, horizontally splitting the last selected node `i`

### I want to write code FAST

Each time I take my hands off the keyboard to move a mouse I'm breaking a trance.
I'm losing the rythm to what I'm doing.
I'm leaving a world of keystrokes and commands to a world of navigating between buttons with a cursor.
VIM is the king of keyboard shortcuts so here the world is at my fingertips.

***In Visual Mode I want to:***
- [x] Open new tabs `ctrl-t`
- [x] Close tabs    `ctrl-w`
- [x] Switch between tabs `ctrl-shift-{h,l}`
- [ ] Rotate windows CW
- [ ] Rotate windows CCW
- [x] Replace all instances of a word `:%s/word/replacement`
- [x] Incrementally replace instances of a word `:s/word/replacement/c`
- [x] Navigate to a line by writing its number `:num`
- [x] Jump n lines up or down with a single keystroke `n{j,k}`
- [x] Select n lines up or down with a single keystroke `shift-v -> n{j,k}`
- [x] Navigate to top of page 
- [ ] Navigate to middle of page
- [x] Navigate to bottom of page
- [ ] Navigate to top of file `gg`
- [ ] Navigate to middle of file
- [ ] Navigate to bottom of file `G`
- [ ] Insert a newline below or above without entering insert mode `ctrl-{j,k}`
- [ ] Insert a newline below or above, entering insert mode `{o,O}`
- [ ] Enter insert mode at start of line
- [ ] Enter insert mode at middle of line
- [ ] Enter insert mode at end of line
- [ ] Comment out selected block

***In Insert Mode I want to:***
- [ ] Navigate to start of line
- [ ] Navigate to end of line
- [ ] Navigate to newline above without splitting current line
- [ ] Navigate to newline below without splitting current line
- [ ] Enter visual mode with current line selected
- [ ] Enter visual mode with current word selected

***In Visual AND Insert Mode I want to:***
- [ ] Comment out current line
- [ ] Delete line
- [ ] Delete line contents under AND after cursor
- [ ] Delete line contents before cursor
- [ ] Delete key under cursor AND succeeding WORD
- [ ] Delete key under cursor AND preceeding WORD

### I want to have full control over extensions

In NVIM I can manually install extensions which provide some functionality.
I want to configure shortcuts and usage of said extensions manually such that they're never in my way or hard to use.

***I want extensions to:***
- [ ] Preview .md files
- [ ] Preview .puml files
- [ ] Preview .tex files
- [ ] Provide syntax highlighting
- [ ] Provide linting
- [ ] Provide snippets for .tex files
- [ ] Provide snippets for .py files
- [ ] Provide snippets for .java files
- [ ] Provide snippets for .sh files
- [ ] Provide snippets for .js files
- [ ] Provide snippets for .jsx files
- [ ] Provide snippets for .html files
- [ ] Provide snippets for .css files
- [ ] Provide snippets for .puml files
- [ ] Offer usage of manually created snippets for specified filetypes
- [ ] Show basic information about git repositories when applicable

### What's bugging my about NVIM?

- [ ] Exiting nvim to write commands to terminal requires manually writing and quitting each window AND THEN manually quitting NERDTree
- [ ] Ultisnips and coc are not playing well together

## Shortcuts

Operators
---
| Key | Name | Description |
| --- | --- | --- |
| c | change | change selected block into whatever you type |
| r | replace | replace character under cursor with succeeding character |
| x | delete | delete character under cursor or selection made by motion |
| i | insert | enter insert mode before cursor |
| a | append | enter insert mode after cursor |
| I | insert | enter insert mode before line |
| A | append | enter insert mode after line |

Motions
---
| Key | Name | Description |
| --- | --- | --- |
| w | word | moves cursor to beginning of next word |
| b | back | moves cursor to beginning of current word |
| e | end[word] | moves cursor to end of next word |
| $ | end[line] | moves cursor to end of line |

