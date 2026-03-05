class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.8.4"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.4/bugster-macos-intel.zip"
        sha256 "ef0d4eb48a7aa7f9321a77684413d75b1beddf452baa45a5c73480d9a9ba8d37"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.4/bugster-macos-arm64.zip"
        sha256 "8de76b05febecccf644f21425d9bc36845784f019096c7774b02ac1d61e831c5"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.4/bugster-linux.zip"
      sha256 "e65adb196773ea4250a5a3af48583f6ada9414a03d89e2075aee98267a257442"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.68", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.8.4", output
    end
  end
