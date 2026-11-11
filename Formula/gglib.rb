# Rendered by scripts/render_homebrew.sh into mmogr/homebrew-tap on each
# stable release. Edit this template in the gglib repository, not the tap.
class Gglib < Formula
  desc "Local model runtime and OpenAI-compatible proxy for llama.cpp"
  homepage "https://github.com/mmogr/gglib"
  version "0.33.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/mmogr/gglib/releases/download/v#{version}/gglib-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "228d5bad2d28e61b1ad7b345a66b7de3b32bcc80f8e695cc28dd49c6cc081aa3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mmogr/gglib/releases/download/v#{version}/gglib-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b68ca118396530e0e3659c7001f9dadedb3ced4bf02bb73e88b0a652d6a649c0"
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
