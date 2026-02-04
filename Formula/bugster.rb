class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.7.11"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.11/bugster-macos-intel.zip"
        sha256 "a154eec412bd0f036fd9934e3c2d047443451211a5ef2948822b31c939c303b8"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.11/bugster-macos-arm64.zip"
        sha256 "9c0515add0d4cf8b3aeae03a3724635302d9f62018311a99d9c5c0f29beba53b"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.11/bugster-linux.zip"
      sha256 "85390cc6ccef2eee14539909e1d144b3c2aa8b721397a93c2f69178bef38b49d"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1770157258000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1770157258000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.63", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.7.11", output
    end
  end
