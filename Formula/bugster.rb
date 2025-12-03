class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.7.5"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.5/bugster-macos-intel.zip"
        sha256 "97d811b85ce852a1d23e49adaaf6cde409d0424cc08a0c32bc76ae934f644787"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.5/bugster-macos-arm64.zip"
        sha256 "9cf8c8035d74d39b5de2fdb5c28dd25ad8489d9afa6dbdfdc93ce0d0e2b332fc"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.5/bugster-linux.zip"
      sha256 "ed3f4f118ee557170220a50bebe07d4bdeb0bb2ec8d8e66ff6c017059a8cf2f7"
    end
  
    def install
      system "npx", "-y", "playwright@1.58.0-alpha-2025-11-30", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.58.0-alpha-2025-11-30", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.49", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.7.5", output
    end
  end
