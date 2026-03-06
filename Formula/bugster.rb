class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.8.5"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.5/bugster-macos-intel.zip"
        sha256 "48845c6d94b9a2e1b3c2a0f33b07b379ca536039cd6a82e31736284d6ded444f"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.5/bugster-macos-arm64.zip"
        sha256 "5e32388e269e8749f674566b120585d63017d46c56934f47a80ae97f36d68a1b"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.5/bugster-linux.zip"
      sha256 "ac0faba7cf01481769f117e95d4da35cf664eaffab5118876192cc1479ae38ca"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.68", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.8.5", output
    end
  end
