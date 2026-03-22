class Kb < Formula
  desc "A CLI knowledge base backed by SQLite — store, search, and link markdown documents with YAML frontmatter metadata"
  homepage "https://github.com/misham/kb"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/misham/kb/releases/download/v1.2.0/kb-darwin-arm64"
      sha256 "194e781bb498a64fbed9e676f8f11b52bc44ea234dc66c3c3b3759791c95d583"
    elsif Hardware::CPU.intel?
      url "https://github.com/misham/kb/releases/download/v1.2.0/kb-darwin-amd64"
      sha256 "0414edb331d7175983930fa7e3c7fc2c3ebaebcf4af8c4299e7fdcadde1e79fa"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/misham/kb/releases/download/v1.2.0/kb-linux-amd64"
      sha256 "90089e365a7ad9d22fcf3ae7e22d244850a35404cc1e74d47680fde57a313d00"
    end
  end

  def install
    cpu = Hardware::CPU.arm? ? "arm64" : "amd64"
    if OS.mac?
      bin.install "kb-darwin-#{cpu}" => "kb"
    elsif OS.linux?
      bin.install "kb-linux-#{cpu}" => "kb"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kb --version 2>&1", 0)
  end
end
