class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.7.1"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.1/bugster-macos-intel.zip"
        sha256 "ddb537dd8786781c1a3730ff78a6bef59c8c2024b394ecfa804af9475add68c8"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.1/bugster-macos-arm64.zip"
        sha256 "19a70a75cfb1c7a1150d64e10c33c596f2cc3831304e6f92f68bfdaf1e953f8f"
      end
    end
  
    def install
      system "npx", "-y", "playwright@1.58.0-alpha-2025-11-30", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.58.0-alpha-2025-11-30", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.49", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.7.1", output
    end
  end
