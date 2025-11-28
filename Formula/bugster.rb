class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.6.8"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.6.8/bugster-macos-intel.zip"
        sha256 "41d23ffb5cb45329a228fad5c07ac7ec705ae653ba25c45d63d036ce1c5595bf"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.6.8/bugster-macos-arm64.zip"
        sha256 "ba3abf71d440e162d174a262a8ba5209ccbe2e82f1892564d53b8b5eb93c0638"
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
      assert_match "0.6.8", output
    end
  end
