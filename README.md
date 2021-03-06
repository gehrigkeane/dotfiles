# \\[._.]/ - Hi, I'm the MacOS bot

I will update your MacOS machine with Better™ system defaults, preferences, software configuration and even auto-install some handy development tools and apps that my developer friends find helpful.

You don't need to install or configure anything upfront! This works with a brand-new machine from the factory as well as an existing machine that you've been working with for years.

## TLDR

For full bootstrapping glory use:

```bash
git clone --recurse-submodules https://github.com/gehrigkeane/dotfiles ~/.dotfiles
cd ~/.dotfiles;
# run this using terminal (not iTerm, lest iTerm settings get discarded on exit)
./install.sh
```

Otherwise, the following simply installs software listed in [`homedir/.Brewfile`](homedir/.Brewfile)

```bash
git clone --recurse-submodules https://github.com/gehrigkeane/dotfiles ~/.dotfiles
cd ~/.dotfiles;
# run this using terminal (not iTerm, lest iTerm settings get discarded on exit)
./install-lite.sh
```

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [\\[._.]/ - Hi, I'm the MacOS bot](#hi-im-the-macos-bot)
  - [TLDR](#tldr)
  - [Forget About Manual Configuration!](#forget-about-manual-configuration)
  - [Watch me run!](#watch-me-run)
  - [Installation](#installation)
    - [Restoring Dotfiles](#restoring-dotfiles)
  - [Additional](#additional)
    - [VIM as IDE](#vim-as-ide)
    - [Crontab](#crontab)
    - [Remap Caps-Lock](#remap-caps-lock)
  - [Settings](#settings)
    - [Prompt Driven Configuration](#prompt-driven-configuration)
    - [SSD-specific tweaks](#ssd-specific-tweaks)
    - [General System Changes](#general-system-changes)
    - [Security](#security)
    - [Trackpad, mouse, keyboard, Bluetooth accessories, and input](#trackpad-mouse-keyboard-bluetooth-accessories-and-input)
    - [Configuring the Screen](#configuring-the-screen)
    - [Finder Configs](#finder-configs)
    - [Dock & Dashboard](#dock--dashboard)
    - [Configuring Hot Corners](#configuring-hot-corners)
    - [Configuring Safari & WebKit](#configuring-safari--webkit)
    - [Configuring Mail](#configuring-mail)
    - [Spotlight](#spotlight)
    - [Terminal](#terminal)
    - [iTerm2](#iterm2)
    - [Time Machine](#time-machine)
    - [Activity Monitor](#activity-monitor)
    - [Address Book, Dashboard, iCal, TextEdit, and Disk Utility](#address-book-dashboard-ical-textedit-and-disk-utility)
    - [Mac App Store](#mac-app-store)
    - [Messages](#messages)
  - [Software Installation](#software-installation)
    - [Utilities](#utilities)
    - [Apps](#apps)
  - [License](#license)
  - [Contributions](#contributions)
  - [Loathing, Mehs and Praise](#loathing-mehs-and-praise)
  - [Tips Accepted](#tips-accepted)
  - [¯\\\_(ツ)\_/¯ Warning / Liability](#%C2%AF%E3%83%84%C2%AF-warning--liability)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Forget About Manual Configuration!

Don't you hate getting a new laptop or joining a new team and then spending a whole day setting up your system preferences and tools? Me too. That's why we automate; we did it once and we don't want to have to do it again.

\\[^_^]/ - This started as [Adam Eivy](http://adameivy.com)'s MacOS shell configuration dotfiles but has grown to a multi-developer platform for machine configuration.

When I finish with your machine, you will be able to look at your command-line in full-screen mode like this (running iTerm):

![iTerm Screenshot](https://raw.githubusercontent.com/atomantic/dotfiles/master/img/term.png)

Check out how your shell prompt includes the full path, node.js version & the working git branch along with a lot of other info!
We use powerlevel9k for command prompt, so customization of what you want is easily changable in `./.zshrc`
The top terminal is using vim as a full replacement IDE.
The bottom left two are git terminals.
The bottom right is running `vtop`

To launch fullscreen, hit `Command + Enter` in iTerm, then use `Command + d` and `Command + D` to create split panes.

\\[._.]/ - I'm so excited I just binaried in my pants!

## Watch me run!

![Running](http://media.giphy.com/media/5xtDarwenxEoFeIMEM0/giphy.gif)

## Installation

> Note: Post-run configure Powerlevel9k via "https://gist.github.com/kevin-smets/8568070"
> Note: I recommend forking this repo in case you don't like anything I do and want to set your own preferences (and pull request them!)

> ☢️ REVIEW WHAT THIS SCRIPT DOES PRIOR TO RUNNING: https://github.com/atomantic/dotfiles/blob/master/install.sh#L275-L1038
> It's always a good idea to review arbitrary code from the internet before running it on your machine with sudo power!
> You are responsible for everything this script does to your machine (see LICENSE)
> The creator of this repo has a high tolerance for nuking his machine and starting over. If you have a low tolerance for this, proceed with caution.

```bash
git clone --recurse-submodules https://github.com/gehrigkeane/dotfiles ~/.dotfiles
cd ~/.dotfiles;
# run this using terminal (not iTerm, lest iTerm settings get discarded on exit)
./install.sh
```

- When it finishes, open iTerm and press `Command + ,` to open preferences. Under Profiles > Colors, select "Load Presets" and choose the `BestSolarized` scheme. If it isn't there for some reason, import it from `~/.dotfiles/configs` -- you may also need to select the `Hack` font and check the box for non-ascii font and set to `Roboto Mono For Powerline` (I've had mixed results for automating these settings--love a pull request that improves this)
- I've also found that you need to reboot before fast key repeat will be enabled

> Note: if you have problems cloning the submodules behind proxy, you can use this command to convert `git://` to `https://`: `git config --global url.https://github.com/.insteadOf git://github.com/`

> Note: running install.sh is idempotent. You can run it again and again as you add new features or software to the scripts! I'll regularly add new configurations so keep an eye on this repo as it grows and optimizes.

### Restoring Dotfiles

If you have existing dotfiles for configuring git, zsh, vim, etc, these will be backed-up into `~/.dotfiles_backup/$(date +"%Y.%m.%d.%H.%M.%S")` and replaced with the files from this project. You can restore your original dotfiles by using `./restore.sh $RESTOREDATE` where `$RESTOREDATE` is the date folder name you want to restore.

> The restore script does not currently restore system settings--only your original dotfiles. To restore system settings, you'll need to manually undo what you don't like (so don't forget to fork, review, tweak)

## Additional

### VIM as IDE

I am moving away from using `Atom` and instead using `vim` as my IDE. I use Vundle to manage vim plugins (instead of pathogen). Vundle is better in many ways and is compatible with pathogen plugins. Additionally, vundle will manage and install its own plugins so we don't have to use git submodules for all of them.

### Crontab

You can `cron ~/.crontab` if you want to add my nightly cron software updates.

> \\[0_0]/ - Note that this may wake you in the morning to compatibility issues so use only if you like being on the edge

### Remap Caps-Lock

- I highly recommend remapping your Caps Lock key to Control per [Dr. Bunsen](http://www.drbunsen.org/remapping-caps-lock/):
![Remap Caps Lock](https://raw.githubusercontent.com/atomantic/dotfiles/master/img/remap_capslock.png)

## Settings

This project changes a number of settings and configures software on MacOS.
Here is the current list:

### Prompt Driven Configuration

The following will only happen if you agree on the prompt

- install a gitshots script to take a photo using your camera on every git commit (these go in as a post-commit hook to your .git_template)
- overwrite your /etc/hosts file with a copy from someonewhocares.org (see ./configs/hosts for the file that will be used)
- replace the system wallpaper with `img/wallpaper.jpg`

### SSD-specific tweaks

- Disable local Time Machine snapshots
- Disable hibernation (speeds up entering sleep mode)
- Remove the sleep image file to save disk space

### General System Changes

- Always boot in verbose mode (not MacOS GUI mode)
- Disable the sound effects on boot
- Menu bar: disable transparency
- Menu bar: hide the Time Machine, Volume, User, and Bluetooth icons
- Set highlight color to green
- Set sidebar icon size to medium
- Always show scrollbars
- Increase window resize speed for Cocoa applications
- Expand save panel by default
- Expand print panel by default
- Allow 'locate' command
- Set standby delay to 24 hours (default is 1 hour)
- Save to disk (not to iCloud) by default
- Automatically quit printer app once the print jobs complete
- Disable the “Are you sure you want to open this application?” dialog
- Remove duplicates in the “Open With” menu (also see 'lscleanup' alias)
- Display ASCII control characters using caret notation in standard text views
- Disable automatic termination of inactive apps
- Disable the crash reporter
- Set Help Viewer windows to non-floating mode
- Reveal IP, hostname, OS, etc. when clicking clock in login window
- Restart automatically if the computer freezes
- Never go into computer sleep mode
- Check for software updates daily, not just once per week
- Disable smart quotes as they’re annoying when typing code
- Disable smart dashes as they’re annoying when typing code

### Security

- Enable firewall
- Enable firewall stealth mode (no response to ICMP / ping requests)
- Disable remote apple events
- Disable wake-on modem
- Disable wake-on LAN
- Disable guest account login

### Trackpad, mouse, keyboard, Bluetooth accessories, and input

- Trackpad: enable tap to click for this user and for the login screen
- Trackpad: map bottom right corner to right-click
- Disable “natural” (Lion-style) scrolling
- Increase sound quality for Bluetooth headphones/headsets
- Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
- Use scroll gesture with the Ctrl (^) modifier key to zoom
- Follow the keyboard focus while zoomed in
- Disable press-and-hold for keys in favor of key repeat
- Set a blazingly fast keyboard repeat rate:
- Set language and text formats (english/US)
- Disable auto-correct

### Configuring the Screen

- Require password immediately after sleep or screen saver begins
- Save screenshots to the Desktop/screen_caps
- Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
- Disable shadow in screenshots
- Enable subpixel font rendering on non-Apple LCDs
- Enable HiDPI display modes (requires restart)

### Finder Configs

- Keep folders on top when sorting by name (Sierra only)
- Allow quitting via ⌘ + Q; doing so will also hide desktop icons
- Disable window animations and Get Info animations
- Set `~/` as the default location for new Finder windows
- Show hidden files by default
- Show all filename extensions
- Show status bar
- Show path bar
- Allow text selection in Quick Look
- Display full POSIX path as Finder window title
- When performing a search, search the current folder by default
- Disable the warning when changing a file extension
- Enable spring loading for directories
- Remove the spring loading delay for directories
- Avoid creating .DS_Store files on network volumes
- Disable disk image verification
- Automatically open a new Finder window when a volume is mounted
- Use list view in all Finder windows by default
- Disable the warning before emptying the Trash
- Empty Trash securely by default
- Enable AirDrop over Ethernet and on unsupported Macs running Lion
- Show the ~/Library folder
- Expand the following File Info panes: “General”, “Open with”, and “Sharing & Permissions”

### Dock & Dashboard

- Enable highlight hover effect for the grid view of a stack (Dock)
- Set the icon size of Dock items to 36 pixels
- Change minimize/maximize window effect to scale
- Minimize windows into their application’s icon
- Enable spring loading for all Dock items
- Show indicator lights for open applications in the Dock
- Don’t animate opening applications from the Dock
- Speed up Mission Control animations
- Don’t group windows by application in Mission Control
- Disable Dashboard
- Don’t show Dashboard as a Space
- Don’t automatically rearrange Spaces based on most recent use
- Remove the auto-hiding Dock delay
- Remove the animation when hiding/showing the Dock
- Automatically hide and show the Dock
- Make Dock icons of hidden applications translucent
- Make Dock more transparent
- Reset Launchpad, but keep the desktop wallpaper intact

### Configuring Hot Corners

- ~~Top left screen corner → Mission Control~~
- ~~Top right screen corner → Desktop~~
- Bottom right screen corner → Start screen saver

### Configuring Safari & WebKit

- Set Safari’s home page to ‘about:blank’ for faster loading
- Prevent Safari from opening ‘safe’ files automatically after downloading
- Allow hitting the Backspace key to go to the previous page in history
- Hide Safari’s bookmarks bar by default
- Hide Safari’s sidebar in Top Sites
- Disable Safari’s thumbnail cache for History and Top Sites
- Enable Safari’s debug menu
- Make Safari’s search banners default to Contains instead of Starts With
- Remove useless icons from Safari’s bookmarks bar
- Enable the Develop menu and the Web Inspector in Safari
- Add a context menu item for showing the Web Inspector in web views

### Configuring Mail

- ~~Disable send and reply animations in Mail.app~~
- ~~Copy email addresses as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app~~
- ~~Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app~~
- ~~Display emails in threaded mode, sorted by date (oldest at the top)~~
- ~~Disable inline attachments (just show the icons)~~
- ~~Disable automatic spell checking~~

### Spotlight

- Hide Spotlight tray-icon (and subsequent helper)
- Disable Spotlight indexing for any volume that gets mounted and has not yet been indexed
- Change indexing order and disable some file types from being indexed
- Load new settings before rebuilding the index
- Make sure indexing is enabled for the main volume

### Terminal

- Only use UTF-8 in Terminal.app
- Install the Solarized Dark theme for Terminal.app
- Enable “focus follows mouse” for Terminal.app and all X11 apps

### iTerm2

- Install the Solarized Light theme for iTerm
- Install the Patched Solarized Dark theme for iTerm
- Install the Gehrig Solarized 2019 theme for iTerm
- Install the Gehrig 2019 dynamic profile for iTerm
- Don’t display the annoying prompt when quitting iTerm
- ~~Hide tab title bars~~
- Set system-wide hotkey to show/hide iterm with ctrl+tick ( `^` + `)
- ~~Set normal font to Hack 12pt~~
- ~~Set non-ascii font to Roboto Mono for Powerline 12pt~~

### Time Machine

- Prevent Time Machine from prompting to use new hard drives as backup volume
- Disable local Time Machine backups

### Activity Monitor

- Show the main window when launching Activity Monitor
- Visualize CPU usage in the Activity Monitor Dock icon
- Show all processes in Activity Monitor
- Sort Activity Monitor results by CPU usage

### Address Book, Dashboard, iCal, TextEdit, and Disk Utility

- Enable the debug menu in Address Book
- Enable Dashboard dev mode (allows keeping widgets on the desktop)
- Use plain text mode for new TextEdit documents
- Open and save files as UTF-8 in TextEdit
- Enable the debug menu in Disk Utility

### Mac App Store

- Enable the WebKit Developer Tools in the Mac App Store
- Enable Debug Menu in the Mac App Store

### Messages

- Disable automatic emoji substitution (i.e. use plain text smileys)
- Disable smart quotes as it’s annoying for messages that contain code
- Disable continuous spell checking

## Software Installation

homebrew, fontconfig, [powerline/fonts](https://github.com/powerline/fonts) git, ruby (latest), zsh (latest), and [zplug](https://github.com/zplug/zplug) are all installed inside the `install.sh` as foundational software for running this project.
Additional software is configured in `homedir/.Brewfile` and can be customized in your own fork/branch (you can change everything in your own fork/branch).
The following is the software that I have set as default:

### Utilities

- ack
- openssl
- readline
- xz
- ansible
- autojump
- awscli
- bat
- bash
- boost
- brew-cask-completion
- brotli
- capnp
- cmake
- cookiecutter
- coreutils
- docker-credential-helper-ecr
- dos2unix
- erlang
- elixir
- exa
- findutils
- fzf
- gawk
- git
- gnu-sed
- gnupg
- go
- grep
- gti
- htop
- httpie
- hub
- jq
- libmagic
- libsodium
- lz4
- mas
- moreutils
- mysql-client
- ncdu
- nethogs
- nghttp2
- nmap
- octave
- pipenv
- postgresql
- protobuf
- pyenv
- python
- python-yq
- reattach-to-user-namespace
- redis
- ripgrep
- rtv
- screen
- speedtest-cli
- terraform
- tig
- tldr
- tmux
- trash
- tree
- ttyrec
- unixodbc
- vim
- watch
- watchman
- wget
- wrk
- yarn
- zsh
- zsh-autosuggestions
- zsh-syntax-highlighting
- cjbassi/gotop/gotop
- gemfury/tap/gemfury

### Apps

- aerial
- alacritty
- android-file-transfer
- azure-data-studio
- bartender
- battle-net
- dash
- docker
- filezilla
- firefox
- flycut
- font-awesome-terminal-fonts
- font-fontawesome
- font-hack
- font-inconsolata-dz-for-powerline
- font-inconsolata-for-powerline
- font-inconsolata-g-for-powerline
- font-roboto-mono
- font-roboto-mono-for-powerline
- font-source-code-pro
- font-source-code-pro-for-powerline
- google-chrome
- intellij-idea
- pycharm
- istat-menus
- iterm2
- karabiner-elements
- kitty
- logitech-options
- macs-fan-control
- notion
- pgadmin4
- postman
- qlcolorcode
- qlimagesize
- qlmarkdown
- qlprettypatch
- qlstephen
- quicklook-csv
- quicklook-json
- robo-3t
- sequel-pro
- spectacle
- slack
- spotify
- steam
- sublime-text
- the-unarchiver
- tunnelblick
- visual-studio-code
- vlc
- webpquicklook

## License

This project is licensed under ISC. Please fork, contribute and share.

## Contributions

Contributions are always welcome in the form of pull requests with explanatory comments.

Please refer to the [Contributor Covenant](https://github.com/atomantic/dotfiles/blob/master/CODE_OF_CONDUCT.md)

## Loathing, Mehs and Praise

1. Loathing should be directed into pull requests that make it better. woot.
2. Bugs with the setup should be put as GitHub issues.
3. Mehs should be > /dev/null
<<<<<<< HEAD
4. Praise should be directed to [![@antic](https://img.shields.io/twitter/follow/antic.svg?style=social&label=@antic)](https://twitter.com/antic)

# Tips Accepted
⚡ Lightning Network Satoshi Tips Accepted https://tippin.me/@antic
> With the advent of Bitcoin Lightning Network, you can tip me as little as 1 satoshi (.00000001 $BTC). 1000 satoshi is about $.04 as of this writing. Any amount is appreciated and playing with Lightning will help you learn about the future of the internet! :)

Don't have Lightning?
- [Blue Wallet (for iOS and Android)](https://bluewallet.io/)
- [Eclair Wallet (for Android)](https://play.google.com/store/apps/details?id=fr.acinq.eclair.wallet.mainnet2)
||||||| parent of 262e230 (Update README.md)
4. Praise should be directed to ![@antic](https://img.shields.io/twitter/follow/antic.svg?style=social&label=@antic)
=======
4. Praise should be directed to [![@antic](https://img.shields.io/twitter/follow/antic.svg?style=social&label=@antic)](https://twitter.com/antic)

## Tips Accepted

⚡ Lightning Network Satoshi Tips Accepted https://tippin.me/@antic
> With the advent of Bitcoin Lightning Network, you can tip me as little as 1 satoshi (.00000001 $BTC). 1000 satoshi is about $.04 as of this writing. Any amount is appreciated and playing with Lightning will help you learn about the future of the internet! :)

Don't have Lightning?

- [Blue Wallet (for iOS and Android)](https://bluewallet.io/)
- [Eclair Wallet (for Android)](https://play.google.com/store/apps/details?id=fr.acinq.eclair.wallet.mainnet2)
>>>>>>> 262e230 (Update README.md)

## ¯\\\_(ツ)\_/¯ Warning / Liability

> Warning:
The creator of this repo is not responsible if your machine ends up in a state you are not happy with. If you are concerned, look at the code to review everything this will do to your machine :)
