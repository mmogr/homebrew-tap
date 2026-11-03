# Rendered by scripts/render_homebrew.sh into mmogr/homebrew-tap on each
# stable release. Edit this template in the gglib repository, not the tap.
cask "gglib-gui" do
  version "0.30.1"
  sha256 "2b903298120c7551e4063581d58772f4c91bdd366aecd3ba9589a6512cb9decf"

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
