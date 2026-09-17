class Displayctrl < Formula
  desc "macOS CLI for managing display mirroring and resolution"
  homepage "https://github.com/happitec-inc/displayctrl"
  url "https://github.com/happitec-inc/displayctrl.git",
      tag:      "v0.1.0",
      revision: "3b1a301968cfffca9cae3e0644077bf79b7d0f37"
  version "0.1.0"
  license "GPL-3.0-or-later"

  depends_on xcode: ["16.0", :build]
  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/displayctrl"
  end

  test do
    assert_match "DisplayControl", shell_output("#{bin}/displayctrl --help")
  end
end
