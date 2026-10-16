# Rendered by scripts/render_homebrew.sh into mmogr/homebrew-tap on each
# stable release. Edit this template in the gglib repository, not the tap.
cask "gglib-gui" do
  version "0.26.0"
  sha256 "460337790ab300c7d27e03eb8d4fc2391b7345ddc4c57accc861e69a290bd04d"

  url "https://github.com/mmogr/gglib/releases/download/v#{version}/gglib-gui-#{version}-aarch64-apple-darwin.dmg"
  name "GGLib GUI"
  desc "Desktop app for gglib, a local model runtime for llama.cpp"
  homepage "https://github.com/mmogr/gglib"

  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "GGLib GUI.app"

  # The app is not signed with a Developer ID, so Gatekeeper refuses a
  # quarantined copy. This is the step scripts/macos-install.command does by
  # hand for the .tar.gz download.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/GGLib GUI.app"]
  end

  caveats "The gglib command-line tool is a separate formula: brew install mmogr/tap/gglib"
end
