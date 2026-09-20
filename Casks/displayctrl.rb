cask "displayctrl" do
  version "0.2.2"
  sha256 "e8477d8ce75cc244493ac3ccc2508599a384b48291899060813104d46f7c4cae"

  url "https://github.com/happitec-inc/displayctrl/releases/download/v#{version}/displayctrl-v#{version}-macos.zip"
  name "DisplayControl"
  desc "Display configuration manager and menu bar companion for macOS"
  homepage "https://github.com/happitec-inc/displayctrl"

  depends_on macos: ">= :sonoma"

  app "DisplayControl.app"
  app "DisplayControlMenu.app"
  binary "displayctrl"

  zap trash: [
    "~/Library/Application Support/DisplayControl",
    "~/Library/Application Support/com.happitec.displayctrl",
    "~/Library/Preferences/com.happitec.displayctrl.plist",
    "~/Library/Preferences/com.happitec.displayctrl.menu.plist",
    "~/.config/displayctrl",
  ]
end
