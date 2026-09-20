cask "displayctrl" do
  version "0.2.1"
  sha256 "37f8f20012e2671a547591c2a570d3364476606cafef24adddf6b7645c638a2a"

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
