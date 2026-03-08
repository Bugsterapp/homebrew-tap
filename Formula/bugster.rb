class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.8.7"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.7/bugster-macos-intel.zip"
        sha256 "c671bb9c2fa62171e35b40861d8cd35cd6b409f4f30cb12be87a72444a311998"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.7/bugster-macos-arm64.zip"
        sha256 "40482e209f68c3ad4eaf2b3290500c6584f71498dfffc7c07fc65a487155618e"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.7/bugster-linux.zip"
      sha256 "3e73166d17da277f8fd065641b36cc4b14fae90b8adab885aff56fe8f2c17f7d"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.68", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.8.7", output
    end
  end
