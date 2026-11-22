# Rendered by scripts/render_homebrew.sh into mmogr/homebrew-tap on each
# stable release. Edit this template in the gglib repository, not the tap.
#
# The gglib command alone, for macOS and Linux. On a Mac the gglib cask
# installs the desktop app with this same command.
class GglibCli < Formula
  desc "Local model runtime and OpenAI-compatible proxy for llama.cpp (command only)"
  homepage "https://github.com/mmogr/gglib"
  version "0.39.1"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/mmogr/gglib/releases/download/v#{version}/gglib-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a169ae99daa5e7125ed72ff31232a3e7adefe081ff7ab5561813e6bf746189bb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mmogr/gglib/releases/download/v#{version}/gglib-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "df3eecf8bc3590b4adf82a0baa150fe6be9347d631e0c73ddbae932ec0ce3ec3"
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
