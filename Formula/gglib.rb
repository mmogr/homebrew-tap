# Rendered by scripts/render_homebrew.sh into mmogr/homebrew-tap on each
# stable release. Edit this template in the gglib repository, not the tap.
class Gglib < Formula
  desc "Local model runtime and OpenAI-compatible proxy for llama.cpp"
  homepage "https://github.com/mmogr/gglib"
  version "0.27.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/mmogr/gglib/releases/download/v#{version}/gglib-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "94911bbc017fccebd8f2a1344f85b18ff3ee7d7e246e26798a5ba5913af8b3b8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mmogr/gglib/releases/download/v#{version}/gglib-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9724e72b0d5ce30bc83ec0180cc625cb00020eb50398412099cfa52008bf20a6"
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
