#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
  echo 'Not macOS!'
  exit 1
fi

dock() {
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
}

function finder() {
	# Show the ~/Library directory （ライブラリディレクトリを表示、デフォルトは非表示）
	chflags nohidden ~/Library
	sudo chflags nohidden /Volumes    # /Volumes ディレクトリを見えるようにする

	# Finder: show all filename extensions
	defaults write NSGlobalDomain AppleShowAllExtensions -bool true

	# When performing a search, search the current folder by default
	defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

	# Show Status bar in Finder （ステータスバーを表示）
	defaults write com.apple.finder ShowStatusBar -bool true

	# Show Path bar in Finder （パスバーを表示）
	defaults write com.apple.finder ShowPathbar -bool true

	# Show Tab bar in Finder （タブバーを表示）
	defaults write com.apple.finder ShowTabView -bool true

	# Allow you to select and copy string in QuickLook （QuickLook で文字の選択、コピーを出来るようにする）
	defaults write com.apple.finder QLEnableTextSelection -bool true

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

	# Avoid creating `.DS_Store` files on network volumes （ネットワークディスクで、`.DS_Store` ファイルを作らない）
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
	defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

	# change screenshot dir
	mkdir -p ~/Pictures/screenshots/
	defaults write com.apple.screencapture location ~/Pictures/screenshots/ && killall ControlCenter

	# Prevent Time Machine from prompting to use new hard drives as backup volume
	defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
}

function keyboard() {
	# Disable press-and-hold for keys in favor of key repeat
	defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

	# Set a blazingly fast keyboard repeat rate
	defaults write NSGlobalDomain KeyRepeat -int 3
	defaults write NSGlobalDomain InitialKeyRepeat -int 13

	defaults write NSGlobalDomain AppleLanguages -array "en_AU" "ja"
}

function login() {
	# Require password immediately after sleep or screen saver begins
	defaults write com.apple.screensaver askForPassword -int 1
	defaults write com.apple.screensaver askForPasswordDelay -int 0
}

mail() {
	# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
	defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
}

safari() {
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
}

function trackpad() {
	# Disable “natural” (Lion-style) scrolling
	defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

	# Enable `Tap to click` （タップでクリックを有効にする）
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
	defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
	defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
}

keyboard
login
trackpad
finder
safari
dock
mail

killall Finder
killall Dock
