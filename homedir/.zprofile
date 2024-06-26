##############################################################################
#Import the shell-agnostic (Bash or Zsh) environment config
##############################################################################
source ~/.profile

##############################################################################
# History Configuration
# Note: `head ~/.zsh_history` -> : 1671052122:0;xh --verify no "https://prod-offer-service-1671050729.us-east-1.elasticbeanstalk.com/metrics/service.http.client.UNKNOWN.uri._user_userId_redeem"
##############################################################################
# moved to ~/.zshrc

# Homebrew M1 artifact
eval "$(brew shellenv)"

eval "$(mise activate zsh --shims)"
