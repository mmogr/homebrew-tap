# Rendered by scripts/render_homebrew.sh into mmogr/homebrew-tap on each
# stable release. Edit this template in the gglib repository, not the tap.
class Gglib < Formula
  desc "Local model runtime and OpenAI-compatible proxy for llama.cpp"
  homepage "https://github.com/mmogr/gglib"
  version "0.26.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/mmogr/gglib/releases/download/v#{version}/gglib-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b19f32c011b984de139395a0dd4ea9c7b719f53b90f24e303fc760091809cc94"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mmogr/gglib/releases/download/v#{version}/gglib-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4709db7006578317b1468b29b6da7c4ec164fe89828797ab2511510ce0cecbea"
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
