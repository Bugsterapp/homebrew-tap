class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.7.13"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.13/bugster-macos-intel.zip"
        sha256 "ae0c8438a3befd8ca1246e0b9ee98d7d461644b6a72f4fbb545f91e2fcf1202d"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.13/bugster-macos-arm64.zip"
        sha256 "d9c4af7d281d688a47f1f4694a42ee1644e71a379436fa0798f8b69eb4772a35"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.13/bugster-linux.zip"
      sha256 "47dd8e61c34d445cba895625af3b13c43b7f5a2622934ab596473d8d6af7e328"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1770338664000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1770338664000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.64", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.7.13", output
    end
  end
