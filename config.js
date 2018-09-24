// TODO : fix Iterm colors for exa and clarity
module.exports = {
  brew: [
    // http://conqueringthecommandline.com/book/ack_ag
    'ack',
    'ag',
    'ansible',
    'awscli',
    'bash',
    'boost',
    'brew-cask-completion',
    'capnp',
    'cmake',
    // Install GNU core utilities (those that come with macOS are outdated)
    // Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
    'coreutils',
    'dos2unix',
    'erlang',
    'elixir',
    'mistertea/et/et',
    'exa',
    // Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
    'findutils',
    // 'fortune',
    'fzf',
    'readline', // ensure gawk gets good readline
    'gawk',
    'git',
    'gnupg',
    // Install GNU `sed`, overwriting the built-in `sed`
    // so we can do "sed -i 's/foo/bar/' file" instead of "sed -i '' 's/foo/bar/' file"
    'gnu-sed --with-default-names',
    'go',
    // better, more recent grep
    'grep',
    'gti',
    'htop',
    // https://github.com/jkbrzt/httpie
    'httpie',
    'hub',
    // jq is a sort of JSON grep
    'jq',
    'lz4',
    // Mac App Store CLI: https://github.com/mas-cli/mas
    'mas',
    // Install some other useful utilities like `sponge`
    'moreutils',
    'ncdu',
    'nmap',
    'octave',
    'python',
    'python-yq',
    'reattach-to-user-namespace',
    'rtv',
    // better/more recent version of screen
    'screen',
    'speedtest-cli',
    'terraform',
    'tig',
    'tldr',
    'tmux',
    'trash',
    'todo-txt',
    'tree',
    'ttyrec',
    // better, more recent vim
    'vim --with-client-server --with-override-system-vi',
    'watch',
    'watchman',
    'wget',
    'yarn --without-node',
    'zsh-autosuggestions',
    'zsh-syntax-highlighting'
  ],
  cask: [
    'aerial',                                     // https://github.com/JohnCoates/Aerial Pretty screen-savers
    'bartender',                                  // Not free software https://www.macbartender.com/
    'docker',                                     // https://www.docker.com/community-edition docker for mac
    'filezilla',                                  // https://filezilla-project.org/ FTP GUI
    'flycut',                                     // https://github.com/TermiT/Flycut Clean and simple clipboard manager for developers
    'google-chrome',
    'homebrew/cask-drivers/logitech-options',     // https://support.logitech.com/en_us/software/options Logitech MX series software
    'intel-power-gadget',                         // https://software.intel.com/en-us/articles/intel-power-gadget-20 software-based power usage monitoring tool
    'istat-menus',                                // Not free software https://bjango.com/mac/istatmenus/
    'iterm2',                                     // https://www.iterm2.com/ Best macOS terminal GUI
    'postman',                                    // https://www.getpostman.com/ Amazing API GUI
    'psequel',                                    // http://www.psequel.com/ PostgreSQL GUI tool for macOS
    'qlcolorcode',                                // https://github.com/anthonygelibert/QLColorCode QuickLook for code
    'qlimagesize',                                // https://github.com/Nyx0uf/qlImageSize QuickLook image info
    'qlmarkdown',                                 // https://github.com/toland/qlmarkdown QuickLook generator for Markdown files
    'qlprettypatch',                              // https://github.com/atnan/QLPrettyPatch QuickLook generator for patch files
    'qlstephen',                                  // https://whomwah.github.io/qlstephen/ QuickLook plugin for plain text files sans file extension
    'quicklook-csv',                              // https://github.com/p2/quicklook-csv
    'quicklook-json',                             // http://www.sagtau.com/quicklookjson.html
    'sequel-pro',                                 // https://www.sequelpro.com/ Awesome MySQL GUI
    'spectacle',                                  // https://www.spectacleapp.com/ Window control with simple keyboard shortcuts
    'slack',
    'spotify',
    'sublime-text',                               // https://www.sublimetext.com/3 A sophisticated text editor for code, markup and prose
    'the-unarchiver',                             // https://theunarchiver.com/ Nice file archive GUI
    'visual-studio-code',                         // https://code.visualstudio.com/ Code editing redefined
    'vlc'                                         // https://www.videolan.org/vlc/ VLC is a free and open source cross-platform multimedia player 
  ]
};
