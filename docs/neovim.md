# Neovim Configuration

## Key Bindings

### Base Neovim/Vim Key Bindings

| Mode   | Key(s)   | Action/Description                        |
| ------ | -------- | ----------------------------------------- |
| Normal | `i`      | Enter insert mode (start typing)          |
| Normal | `a`      | Insert after cursor                       |
| Normal | `o`      | Open new line below and enter insert mode |
| Normal | `dd`     | Delete (cut) current line                 |
| Normal | `yy`     | Yank (copy) current line                  |
| Normal | `p`      | Paste below cursor                        |
| Normal | `u`      | Undo                                      |
| Normal | `Ctrl+r` | Redo                                      |
| Normal | `/`      | Search forward                            |
| Normal | `n`      | Next search result                        |
| Normal | `N`      | Previous search result                    |
| Normal | `:`      | Enter command mode (e.g., `:w` to save)   |
| Normal | `:q`     | Quit                                      |
| Normal | `:wq`    | Save and quit                             |
| Normal | `:qa!`   | Quit without saving                       |
| Normal | `gg`     | Go to top of file                         |
| Normal | `G`      | Go to bottom of file                      |
| Normal | `0`      | Go to start of line                       |
| Normal | `$`      | Go to end of line                         |
| Normal | `v`      | Start visual (selection) mode             |
| Visual | `y`      | Yank (copy) selection                     |
| Visual | `d`      | Delete (cut) selection                    |
| Insert | `Esc`    | Return to normal mode                     |

---

## Custom Key Bindings

The following custom key bindings are set (using the `<leader>` key, which defaults to `\`):

| Keybinding   | Action                  | Description                 |
| ------------ | ----------------------- | --------------------------- |
| `<leader>ff` | `Telescope find_files`  | Fuzzy file finder           |
| `<leader>fg` | `Telescope live_grep`   | Live grep search in project |
| `<leader>fc` | `Telescope git_commits` | View git commit history     |

**Example:**  
To open the file finder, press `\` then `ff` in normal mode.

---
