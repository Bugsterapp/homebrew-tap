class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.7.8"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.8/bugster-macos-intel.zip"
        sha256 "0f40538c2ec8a8adf763a1d9560728cff5a73ce1b3b4b4563e1774e8463d59ef"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.8/bugster-macos-arm64.zip"
        sha256 "e50070611606181a8fbe4c8f553293d9542a8ab65cbf27d2a1bfee231e08d857"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.8/bugster-linux.zip"
      sha256 "176884440c3bce38e2d1fff19ec14243164c12262bf84a583b30391e0465e6e0"
    end
  
    def install
      system "npx", "-y", "playwright@1.58.0-alpha-2026-01-07", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.58.0-alpha-2026-01-07", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.55", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.7.8", output
    end
  end
