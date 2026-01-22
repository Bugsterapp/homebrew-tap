class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.7.9"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.9/bugster-macos-intel.zip"
        sha256 "fb5d34dbb5814e4cb199e153d9d9d0205537c318ddbace754b766a27dd502445"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.9/bugster-macos-arm64.zip"
        sha256 "7857641096692919456fbd4ce351c01274a1807c29a5c9ebadeab3c440af0feb"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.9/bugster-linux.zip"
      sha256 "ab7453cefdbadaa0d31a254fd06fdc5b23bd60766002f98842f28bb1bf8ee61b"
    end
  
    def install
      system "npx", "-y", "playwright@1.58.0-alpha-2026-01-16", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.58.0-alpha-2026-01-16", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.56", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.7.9", output
    end
  end
