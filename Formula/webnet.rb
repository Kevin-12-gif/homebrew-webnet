require "language/node"

class Webnet < Formula
  desc "Standalone Incognito Web Browser with Chrome identity"
  homepage "https://github.com/Kevin-12-gif/homebrew-webnet"
  url "https://github.com/Kevin-12-gif/homebrew-webnet/archive/refs/heads/main.tar.gz"
  sha256 "6ea930d94650695641cee2b6bbd11ef7bb3d1458a47412529256dc00469f9086"
  license "MIT"
  version "1.0.2"

  depends_on "node"

  on_linux do
    depends_on "webkit2gtk"
    depends_on "gtk+3"
  end

  def install
    # This installs node_modules (including webviewjs) and the webnet binary into libexec
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)

    # Creates a symlink in /usr/local/bin or /opt/homebrew/bin
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      WebNet requires a graphical environment to run.
      On Linux, ensure you have libwebkit2gtk-4.0 or 4.1 installed if not using Homebrew's version.
    EOS
  end

  test do
    # Simple check to see if the binary was installed correctly
    system "#{bin}/webnet", "--help"
  end
end
