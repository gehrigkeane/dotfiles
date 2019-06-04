Hi guys!

# Q/A

## Why ZSH?

Often, after mentioning I'm a ZSH user, people ask what the differences are compared to BASH. Well:

- Interoperability, scripts with `#!/bin/bash` still run in bash (this may or may not be obvious)
- *Extensive* plugin (eco)system
- Z Shell has an army of MacOS hipsters, who develope and maintain awesome plugins
- Advanced tab completion/navigation system
- Automatic cd
- Inline wildcard expansion
- Recursive path expansion

## Why not csh, fish, or ksh?

Again, an army of hipsters. Seriously, I haven't attempted to daily-drive `fish`, the only comperable alternative, largely because I too am an MacOS hipster... :sadparrot: Also, it's my understanding that the primary quality-of-life features `fish` offers are available to `zsh` as plugins.

### Why Oh My Zsh?

Ok, ZSH sounds neat, so what's [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) and why should you use a ZSH plugin framework?
Succinctly, read through this list of [awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins).
Plugin frameworks provide the lion-share... lion's share? :shrug: of user friendliness `zsh` has to offer.

Recently, I've migrated from [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) to [zplug](https://github.com/zplug/zplug) which offers everything and more compared to [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh).

Though, there are a plethora of `zsh` framework'esque tools. I recommend you take the time to poke around the ecosystem at some point and make a decision for yourself.

Powerlevel9k https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#option-5-install-for-zplug

## References

- https://www.reddit.com/r/programming/comments/bwjny2/zsh_is_now_the_default_shell_for_macos/
- [Powerlevel9k](https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#option-5-install-for-zplug)

## EDT (every day tools)

- [bat](https://github.com/sharkdp/bat) Alternative to `cat` with syntax highlighting
- [exa](https://the.exa.website) Modern replacement for 'ls'
- [fzf](https://github.com/junegunn/fzf) A command-line fuzzy finder
- [httpie](https://github.com/jkbrzt/httpie) Modern CURL + features (see https://github.com/eliangcs/http-prompt)
- [jq](https://stedolan.github.io/jq/) Awesome JSON command line utility
- [ncdu](https://dev.yorhel.nl/ncdu) NCurses Disk Usage
- [ripgrep](https://github.com/BurntSushi/ripgrep) Search tool like grep and The Silver Searcher
- [tig](https://jonas.github.io/tig/) Text interface for Git repositories
- [tldr](https://tldr.sh/) Simplified and community-driven man pages
- [cjbassi/gotop/gotop](https://github.com/cjbassi/gotop) A terminal based graphical activity monitor inspired by gtop and vtop

## Hipster Cool Tools

- [tmux](https://tmux.github.io/) Terminal multiplexer
- [vim](https://www.vim.org/) Up-to-date vim replacement

## Casks (MacOS Apps)

### Favs

- [bartender](https://www.macbartender.com/)
- [flycut](https://github.com/TermiT/Flycut) Clean and simple clipboard manager for developers
- [istat-menus](https://bjango.com/mac/istatmenus/)
- [spectacle](https://www.spectacleapp.com/) Window control with simple keyboard shortcuts

### Quick Look Extensions

- [qlcolorcode](https://github.com/anthonygelibert/QLColorCode) QuickLook for code
- [qlimagesize](https://github.com/Nyx0uf/qlImageSize) QuickLook image info
- [qlmarkdown](https://github.com/toland/qlmarkdown) QuickLook generator for Markdown files
- [qlprettypatch](https://github.com/atnan/QLPrettyPatch) QuickLook generator for patch files
- [qlstephen](https://whomwah.github.io/qlstephen/) QuickLook plugin for plain text files sans file extension
- [quicklook-csv](https://github.com/p2/quicklook-csv)
- [quicklook-json](http://www.sagtau.com/quicklookjson.html)
- [webpquicklook](https://github.com/emin/WebPQuickLook) QuickLook plugin for WebP image files

### Honorable Mentions

- [karabiner-elements](https://pqrs.org/osx/karabiner/) A powerful and stable keyboard customizer for macOS
- [the-unarchiver](https://theunarchiver.com/) Nice file archive GUI
- [aerial](https://github.com/JohnCoates/Aerial) Pretty screen-savers
