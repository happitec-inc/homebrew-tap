class Displayctrl < Formula
  desc "macOS CLI for managing display mirroring and resolution"
  homepage "https://github.com/happitec-inc/displayctrl"
  url "https://github.com/happitec-inc/displayctrl.git",
      tag:      "v0.1.1",
      revision: "4df3f770655833d4e2519116797d7bc9f88b60f2"
  version "0.1.1"
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
