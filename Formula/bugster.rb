class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.7.3"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.3/bugster-macos-intel.zip"
        sha256 "3a137ded1aac2ba1b00a34db78c90c2c3e7cbcd8d0571d17f12c60bf13ed9def"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.3/bugster-macos-arm64.zip"
        sha256 "503593ff6e3cb3c738c9d33714644248c01acad75643a9da6685078d6c56605b"
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
      assert_match "0.7.3", output
    end
  end
