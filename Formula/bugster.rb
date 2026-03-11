class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.8.10"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.10/bugster-macos-intel.zip"
        sha256 "2cfc84e883eb318d2f30e4428eea1ac9035b6e336803e7694fc00c18484dc584"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.10/bugster-macos-arm64.zip"
        sha256 "ffd27bb062c4d507c19c17517a13d1dee88ed6cd3da526c61c7fe570e2558305"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.10/bugster-linux.zip"
      sha256 "a2aca5b21c03ad923bf5e1730f565bc2117b087d00d957faed6502eb12f9cc9a"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.68", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.8.10", output
    end
  end
