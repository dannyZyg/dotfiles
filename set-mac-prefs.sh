#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
  echo 'Not macOS!'
  exit 1
fi

## Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Disable Notification Center and remove the menu bar icon
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 3
defaults write NSGlobalDomain InitialKeyRepeat -int 13

defaults write NSGlobalDomain AppleLanguages -array "en_AU" "jp"

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Show the ~/Library directory （ライブラリディレクトリを表示、デフォルトは非表示）
chflags nohidden ~/Library
sudo chflags nohidden /Volumes    # /Volumes ディレクトリを見えるようにする

# Show the hidden files （不可視ファイルを表示）
defaults write com.apple.finder AppleShowAllFiles YES

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

## Show Status bar in Finder （ステータスバーを表示）
defaults write com.apple.finder ShowStatusBar -bool true

# Show Path bar in Finder （パスバーを表示）
defaults write com.apple.finder ShowPathbar -bool true

# Show Tab bar in Finder （タブバーを表示）
defaults write com.apple.finder ShowTabView -bool true

# Allow you to select and copy string in QuickLook （QuickLook で文字の選択、コピーを出来るようにする）
defaults write com.apple.finder QLEnableTextSelection -bool true

defaults write com.apple.finder WarnOnEmptyTrash -bool false    # ゴミ箱を空にする前の警告を無効化する

# TODO fix
# Set `${HOME}` as the default location for new Finder windows
# 新しいウィンドウでデフォルトでホームフォルダを開く
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

###############################################################################
# Dock                                                                        #
###############################################################################
# Automatically hide or show the Dock （Dock を自動的に隠す）
defaults write com.apple.dock autohide -bool true

# Hot corners （Mission Control のホットコーナーの設定）
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# Bottom left screen corner → Show Desktop（左下→ デスクトップを表示）
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-bl-modifier -int 0

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0.2
# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0.2

# Safari
# Enable the `Develop` menu and the `Web Inspector` （開発メニューを表示）
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true

# Show the full URL in the address bar (note: this will still hide the scheme)
# アドレスバーに完全なURLを表示
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

## Add a context menu item for showing the `Web Inspector` in web views
# コンテキストメニューにWebインスペクタを追加
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Show Safari's Status Bar （ステータスバーを表示）
defaults write com.apple.Safari ShowStatusBar -bool true

# Don't remember passwords （パスワードを自動入力・記録しない）
defaults write com.apple.Safari AutoFillPasswords -bool false

# Trackpad
# Enable `Tap to click` （タップでクリックを有効にする）
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# その他の設定

# Avoid creating `.DS_Store` files on network volumes （ネットワークディスクで、`.DS_Store` ファイルを作らない）
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# change screenshot dir
mkdir -p ~/Pictures/screenshots/
defaults write com.apple.screencapture location ~/Pictures/screenshots/ && killall SystemUIServer


###############################################################################
# Energy saving                                                               #
###############################################################################

# Enable lid wakeup
sudo pmset -a lidwake 1

# Restart automatically on power loss
sudo pmset -a autorestart 1

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Sleep the display after 15 minutes
sudo pmset -a displaysleep 15


###############################################################################
# Screen                                                                      #
###############################################################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

###############################################################################
# Mail                                                                        #
###############################################################################
# Disable send and reply animations in Mail.app
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true

# Display emails in threaded mode, sorted by date (oldest at the top)
defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

killall Finder
killall Dock
