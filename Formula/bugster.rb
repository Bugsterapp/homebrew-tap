class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.7.6"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.6/bugster-macos-intel.zip"
        sha256 "09dc3aed441c66b09085b5d5899808654f1d7e53de3d229308bbddc0916e1702"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.6/bugster-macos-arm64.zip"
        sha256 "b7590d426d8ebfad662a6ce646e67f2222451d5d740278183f468890e139c36a"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.6/bugster-linux.zip"
      sha256 "5faa1a9ae7569adab9eab7f5d68b9f1ce7ca05003b7995d6176e7a21293e4463"
    end
  
    def install
      system "npx", "-y", "playwright@1.58.0-alpha-1766189059000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.58.0-alpha-1766189059000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.53", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.7.6", output
    end
  end
