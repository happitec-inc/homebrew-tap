class PushoverNotify < Formula
  desc "Send Pushover notifications with optional image attachments"
  homepage "https://github.com/happitec-inc/pushover-notify"
  url "https://github.com/happitec-inc/pushover-notify.git",
      tag:      "v0.2.1",
      revision: "0915fd8808781efc97459776275b21cbd38a48c4"
  version "0.2.1"

  depends_on xcode: ["15.0", :build]
  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/notify"
  end

  def caveats
    <<~EOS
      pushover-notify requires a configuration file at:
        ~/.config/pushover-notify/config

      The config file should contain your Pushover credentials:
        user_key=<your-pushover-user-key>
        api_token=<your-pushover-api-token>

      Credentials can also be passed at runtime via --user-key and --api-token flags.

      If you previously installed the notify binary by hand to a non-Homebrew location,
      the Homebrew-managed binary at #{opt_bin}/notify will take precedence once #{opt_bin}
      appears before your manual install path in PATH. You may remove the hand-installed
      copy to avoid ambiguity, or adjust your PATH ordering. Homebrew typically prepends
      #{HOMEBREW_PREFIX}/bin to PATH automatically.
    EOS
  end

  test do
    assert_match "--message", shell_output("#{bin}/notify --help")
  end
end
