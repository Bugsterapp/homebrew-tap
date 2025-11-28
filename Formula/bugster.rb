class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.7.0"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.0/bugster-macos-intel.zip"
        sha256 "633b4dc6dd28efa72bd95253ed81213df0306ba48cd74c741571050fbbc3590e"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.0/bugster-macos-arm64.zip"
        sha256 "1921230205ba00c228fec4221aab806d575153657334cfef9d6365ad19ba39a7"
      end
    end
  
    def install
      system "npx", "-y", "playwright@1.58.0-alpha-1763757971000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.58.0-alpha-1763757971000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.48", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.7.0", output
    end
  end
