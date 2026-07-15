# Neovim shortcuts

This is a quick reference for this LazyVim configuration. `<leader>` is `Space`.
Press `<leader>sk` to search all currently active keymaps, or `?` inside Neo-tree
to see its complete local keymap.

## Files and search

| Key or command | Action |
| --- | --- |
| `<leader>e` | Toggle Neo-tree at the project root |
| `<leader>E` | Toggle Neo-tree at the current working directory |
| `:Neotree` | Open Neo-tree directly |
| `<leader>ff` | Find files from the project root |
| `<leader>fg` | Find Git-tracked files |
| `<leader>fr` | Find recently opened files |
| `<leader>fb` | Search open buffers |
| `<leader>sg` | Grep from the project root, including hidden files except `.git` |
| `<leader>sk` | Search active keymaps |
| `gf` | Open the file under the cursor |
| `gx` | Open the URL under the cursor |
| `:noautocmd w` | Save without running autocommands, including format-on-save |
| `:wa`, `:Wa`, `:WA` | Save all modified buffers |

## Neo-tree

These keys apply while the Neo-tree window is focused.

| Key | Action |
| --- | --- |
| `<Enter>` | Open a file or expand a directory |
| `S` / `s` | Open in a horizontal / vertical split |
| `t` | Open in a new tab |
| `w` | Open using the window picker |
| `P` | Toggle floating preview |
| `a` / `A` | Add a file / directory |
| `r` / `b` | Rename the path / basename |
| `d` / `T` | Delete / move to trash |
| `u` / `U` | Undo trash / restore from trash |
| `y` / `x` / `p` | Copy / cut / paste using Neo-tree's clipboard |
| `c` / `m` | Copy / move to a path |
| `H` | Toggle hidden files |
| `/` | Fuzzy-find within the tree |
| `f` / `<C-x>` | Apply / clear a filter |
| `<Backspace>` | Navigate to the parent directory |
| `.` | Make the selected directory the tree root |
| `C` / `z` | Close the current node / all nodes |
| `R` | Refresh the tree |
| `<` / `>` | Switch to the previous / next Neo-tree source |
| `q` | Close Neo-tree |
| `?` | Show all Neo-tree mappings |

## Windows, buffers, and tabs

| Key or command | Action |
| --- | --- |
| `<C-h/j/k/l>` | Move to the window on the left/down/up/right |
| `<C-w>n` | Create a new window above the current one |
| `:sp [file]` | Open a horizontal split |
| `:vsp [file]` | Open a vertical split |
| `:vnew` | Open an empty vertical split |
| `<S-h>` / `<S-l>` | Previous / next buffer |
| `[b` / `]b` | Previous / next buffer |
| `<leader>bd` | Delete the current buffer |
| `{count}gt` | Go to tab number `{count}` |
| `gt` / `gT` | Next / previous tab |

## Navigation and editing

| Key | Action |
| --- | --- |
| `gg` / `G` | First / last line |
| `{count}G` | Go to line `{count}` |
| `0` / `^` / `$` | Start of line / first non-blank / end of line |
| `b` / `e` / `w` | Previous word start / word end / next word start |
| `f{char}` | Jump to the next `{char}` on this line |
| `%` | Jump to the matching bracket, brace, or parenthesis |
| `<C-o>` / `<C-i>` | Move backward / forward through the jump list |
| `/text` / `?text` | Search forward / backward |
| `n` / `N` | Next / previous search result |
| `[d` / `]d` | Previous / next diagnostic |
| `K` | Show documentation when an LSP server is attached |
| `u` / `<C-r>` | Undo / redo |
| `D` | Delete to the end of the line |
| `yy` / `dd` | Yank / delete the current line |
| visual `p` | Paste without replacing the clipboard contents |
| terminal `<C-w>` | Leave terminal mode and return to Normal mode |

Operators such as `d`, `c`, and `y` combine with motions. For example, `dw`
deletes a word, `d$` deletes to the end of the line, and `2dw` deletes two
words.

## Substitution

```vim
:[range]s/old/new/[flags]
```

- Omit the range to change only the current line.
- Use `%` for the entire file or `start,end` for a line range.
- Add `g` to replace every match on each selected line.
- Add `c` to confirm each replacement.
- Add `\c` to a search pattern to make that pattern case-insensitive.

Example: `:%s/old/new/gc` replaces every `old` in the file after confirmation.

## LazyVim and development tools

| Key | Action |
| --- | --- |
| `<leader>l` | Open the Lazy plugin manager |
| `<leader>cm` | Open Mason |
| `<leader>cf` | Format the current buffer |
| `<leader>xx` | Open diagnostics in Trouble |
| `<leader>gg` | Open Lazygit at the project root |
| `<leader>bk` / `<leader>bj` | Move up / down the DAP stack |

### Tests

| Key | Action |
| --- | --- |
| `<leader>tn` | Run the nearest test |
| `<leader>tf` | Run tests in the current file |
| `<leader>tA` | Run tests in all files under the working directory |
| `<leader>tS` | Run the test suite |
| `<leader>tl` | Repeat the last test run |
| `<leader>ta` | Attach to a running test |
| `<leader>td` | Debug the nearest test |
| `<leader>tD` | Debug tests in the current file |
| `<leader>ts` | Toggle the test summary |
| `<leader>to` | Open test output |
| `<leader>tO` | Toggle the test output panel |
| `<leader>tt` | Stop the current test run |

## Personal commands

| Command | Action |
| --- | --- |
| `:SC` | Edit this shortcut reference |
| `:VIMRC` | Edit `~/.config/nvim/init.lua` |
| `:RC` | Edit `~/.zshrc` |
| `:NOTES` | Explore `~/notes/` |
| `:TOPICS` | Explore `~/notes/topics/` |
| `:TASKS` | Explore `~/notes/tasks/` |
| `:SP` | Edit `~/notes/scratchpad.md` |
| `:TODO` | Edit `~/notes/todo.md` |
| `:ONCALL` | Edit `~/notes/oncall.md` |
| `:BRUNO` | Edit `~/notes/bruno.md` |
| `:ANDERSON` | Edit `~/notes/anderson.md` |
| `:GO` | Run the current file with `go run` |
| `:LUALOG` | Show the Snacks notification history |
| `:ReloadFromDisk` | Reload unmodified buffers from disk, clear diagnostics, and restart LSP clients |
