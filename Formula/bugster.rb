class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.8.1"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.1/bugster-macos-intel.zip"
        sha256 "ca41e6c770ea6b24e298c9718d635251d07a154dfdb1bd78214069a70e35c506"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.1/bugster-macos-arm64.zip"
        sha256 "fd82432e5d0673577b756e736f6487dbcf731a1786f7fe8384d5f336f42ff170"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.1/bugster-linux.zip"
      sha256 "c12b5547a298022a0e3facf67d40e3ae11b422b2cd6fec977d54d46c4b026a41"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.68", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.8.1", output
    end
  end
