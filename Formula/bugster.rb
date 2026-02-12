class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.7.15"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.15/bugster-macos-intel.zip"
        sha256 "013216150fc9a8e5df036bebfd847032c7225d764f9c46649d6cd332f2bc2cba"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.15/bugster-macos-arm64.zip"
        sha256 "b0d5af6327d68e4e2205db39dfefd8ee813d92c6db51c6fabab99a7c3a2eda70"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.15/bugster-linux.zip"
      sha256 "5dc4984b2c5012f97e75af5677fd9ca7f103a7623e181f168fae663bd2fcdc02"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1770338664000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1770338664000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.64", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.7.15", output
    end
  end
