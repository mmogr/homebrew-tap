# Rendered by scripts/render_homebrew.sh into mmogr/homebrew-tap on each
# stable release. Edit this template in the gglib repository, not the tap.
#
# The gglib command alone, for macOS and Linux. On a Mac the gglib cask
# installs the desktop app with this same command.
class GglibCli < Formula
  desc "Local model runtime and OpenAI-compatible proxy for llama.cpp (command only)"
  homepage "https://github.com/mmogr/gglib"
  version "0.40.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/mmogr/gglib/releases/download/v#{version}/gglib-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "be031dca81e9dd9499765b3f1eb3aa1adc68497716b9899a4c22e785870071ba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mmogr/gglib/releases/download/v#{version}/gglib-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3bde801ecbc231ebb26fc9af2d37f6da9d2ec151dd2af528d073eb50869d61aa"
    end
    depends_on "alsa-lib"
  end

  def install
    bin.install "gglib"
    generate_completions_from_executable(bin/"gglib", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gglib --version")
  end
end
