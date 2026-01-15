class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.7.7"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.7/bugster-macos-intel.zip"
        sha256 "0d0697309d2a57dd6bc546702168257ecd281e079002bb7a6b7c0cd2c3c311f4"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.7/bugster-macos-arm64.zip"
        sha256 "4623817e5a13e01a4f4cef84b91426f23be62adfa05cd51241189d66b20956a2"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.7/bugster-linux.zip"
      sha256 "0d64e7162b6fb977b2e6d1129c932829fcbde61e954585b37a69c3850cf827a1"
    end
  
    def install
      system "npx", "-y", "playwright@1.58.0-alpha-2026-01-07", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.58.0-alpha-2026-01-07", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.55", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.7.7", output
    end
  end
