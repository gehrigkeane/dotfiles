# Tool cheatsheets

Standalone HTML quick-references for the deeply feature-rich tools in this
setup, each matched to the actual config in this dotfiles repo.

Source lives at `home/dev/cheatsheets/` in the chezmoi repo and deploys to
`~/dev/cheatsheets/`.

## View

Open any file in a browser — there is no build step:

```bash
open ~/dev/cheatsheets/index.html
```

`index.html` links every sheet; each sheet also has the same top nav bar.

## Sheets

| File          | Tool        | Sourced from                        |
| ------------- | ----------- | ----------------------------------- |
| `zellij.html` | zellij      | `~/.config/zellij/config.kdl`       |
| `atuin.html`  | atuin       | `~/.config/atuin/config.toml`       |

## Design

- **One shared stylesheet** — `cheatsheet.css`. Palette is **gruvbox-dark**,
  matching ghostty (`theme = Gruvbox Dark`) and the starship prompt
  (`palette = 'gruvbox_dark'`), which is the dominant look of the terminal.
  (Note: zellij's *internal* bars use `everforest-dark` — that's a zellij-only
  theme, called out as a fact in `zellij.html` but not the palette here.)
- **Same structure everywhere**: `sheet-nav` → `header` → `nav.toc` →
  sections/`card`/tables → `insight` → `footer`.
- **Config-accurate, not generic**: sheets document *this* setup — the tuned
  keys, the non-default settings, and any drift worth knowing (e.g. maps that
  outlived their plugin).

## Adding a tool

1. Copy an existing sheet (e.g. `atuin.html`) as `home/dev/cheatsheets/<tool>.html`.
2. Keep `<link rel="stylesheet" href="cheatsheet.css">` and the `sheet-nav` block;
   add a `<a href="<tool>.html">` entry to the nav in **every** sheet + `index.html`.
3. Fill sections from the tool's real config file, not memory — verify keybinds
   against the installed binary (`--help`, official keymap docs).
4. Add a card to `index.html` and a row to the table above.

Good future candidates (feature-rich, in this stack): `fzf`, `zoxide`,
`broot`, `lazygit`, `starship`.
