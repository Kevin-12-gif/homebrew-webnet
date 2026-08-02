require "language/node"

class Webnet < Formula
  desc "Standalone Incognito Web Browser with Chrome identity"
  homepage "https://github.com/Kevin-12-gif/homebrew-webnet"
  url "https://github.com/Kevin-12-gif/homebrew-webnet/archive/refs/heads/main.tar.gz"
  sha256 "a2c9e580b3e6af05e611420e2916cacc5b49b7de5e886e372fd3154a50671f22"
  license "MIT"
  version "1.0.0"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/webnet", "--help"
  end
end
