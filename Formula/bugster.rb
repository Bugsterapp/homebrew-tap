class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.8.0"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.0/bugster-macos-intel.zip"
        sha256 "d4cd0c222fc911b6b51b5a23b1b932be6a3fd40e17336236e8a834e4cc410f4a"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.0/bugster-macos-arm64.zip"
        sha256 "87113597a036132ae60c56feb67f35ff3d3d8f53147b1dd610e25ce3a09e298a"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.0/bugster-linux.zip"
      sha256 "4cd8336fe28bfb20c422dd59d1b9873838c1d38858685f460756d6ab8c391598"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.68", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.8.0", output
    end
  end
