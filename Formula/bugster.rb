class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.8.11"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.11/bugster-macos-intel.zip"
        sha256 "1856f8bdb79b75eaa2cd331def21a0b477d31226f8564088735d994912fa8160"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.11/bugster-macos-arm64.zip"
        sha256 "946c8c07a5899c45881d52e058ffcb0bc5d64a9a553e410c14b8ff8ee94cd4d5"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.11/bugster-linux.zip"
      sha256 "0fc4c1fdd8f7f440ffe26b75000ec38753e46bd6ca2fbffb7abdfe7613e0869c"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.68", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.8.11", output
    end
  end
