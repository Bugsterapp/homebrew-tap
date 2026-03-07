class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.8.6"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.6/bugster-macos-intel.zip"
        sha256 "94e09d02f205702db19b0fdb878154be9583c161e9c4ea90ce94ee4902643cfc"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.6/bugster-macos-arm64.zip"
        sha256 "f93736a711d18ac8b39adb334861769bf49b197c937708a06ffc96192431d9aa"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.6/bugster-linux.zip"
      sha256 "e2e912d0f9fd992c7f09eb528719bbc134350a950f022d09b9617ceb5552861b"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.68", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.8.6", output
    end
  end
