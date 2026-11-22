# Rendered by scripts/render_homebrew.sh into mmogr/homebrew-tap on each
# stable release. Edit this template in the gglib repository, not the tap.
#
# The gglib command alone, for macOS and Linux. On a Mac the gglib cask
# installs the desktop app with this same command.
class GglibCli < Formula
  desc "Local model runtime and OpenAI-compatible proxy for llama.cpp (command only)"
  homepage "https://github.com/mmogr/gglib"
  version "0.39.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/mmogr/gglib/releases/download/v#{version}/gglib-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2d1aa4ba686489b13d28a11bec2205d4b59c4230299e8f0104e38cebf3384281"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mmogr/gglib/releases/download/v#{version}/gglib-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f2a09041fb791cdfdbf21a795cde694798c4def20cc017a2594a87f4c1837fba"
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
