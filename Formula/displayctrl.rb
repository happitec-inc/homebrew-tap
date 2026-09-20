class Displayctrl < Formula
  desc "macOS CLI for managing display mirroring and resolution"
  homepage "https://github.com/happitec-inc/displayctrl"
  url "https://github.com/happitec-inc/displayctrl.git",
      tag:      "v0.2.1",
      revision: "dc580184d2c276ea346a076556cbdb8c3c106270"
  version "0.2.1"
  license "GPL-3.0-or-later"

  depends_on xcode: ["16.3", :build]
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
