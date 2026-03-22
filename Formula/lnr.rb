class Lnr < Formula
  desc "Linear CLI client for humans and LLMs"
  homepage "https://github.com/misham/lnr"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/misham/lnr/releases/download/v1.0.0/lnr-darwin-arm64"
      sha256 "0aa141073ef344e23d5be8fdcaac6b683b3569d35b8263fce59e4e7b594a7a79"
    end
  end

  def install
    bin.install "lnr-darwin-arm64" => "lnr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lnr --version 2>&1", 0)
  end
end
