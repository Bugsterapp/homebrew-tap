class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.7.2"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.2/bugster-macos-intel.zip"
        sha256 "b66f378ec8b6ba258837fd79d200d4fdb0277662386797d4ab137f46a14ece74"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.2/bugster-macos-arm64.zip"
        sha256 "d57191cdb620b3eac6db736870ba836c3f4ab25127db0711c3e0ce999b89e3ba"
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
      assert_match "0.7.2", output
    end
  end
