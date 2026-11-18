# Rendered by scripts/render_homebrew.sh into mmogr/homebrew-tap on each
# stable release. Edit this template in the gglib repository, not the tap.
#
# The gglib command alone, for macOS and Linux. On a Mac the gglib cask
# installs the desktop app with this same command.
class GglibCli < Formula
  desc "Local model runtime and OpenAI-compatible proxy for llama.cpp (command only)"
  homepage "https://github.com/mmogr/gglib"
  version "0.38.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/mmogr/gglib/releases/download/v#{version}/gglib-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "9e99eaa78a13ea9755b39535c3052375e7c3b996906dd9d78bb10e681168143d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mmogr/gglib/releases/download/v#{version}/gglib-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a6a873c9c8d4593a39b5db97af6edd0c8a2fea0dd6bb32300c320e8b0372808"
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
