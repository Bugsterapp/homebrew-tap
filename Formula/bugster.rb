class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.8.12"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.12/bugster-macos-intel.zip"
        sha256 "878b5dc15bb1570cb126c1d6346be068a845dcc0d3d19e034aa1f9273ad59770"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.12/bugster-macos-arm64.zip"
        sha256 "ff771dd5d410594732c1d069b7375e5b73d72579cb076d17098d9fde5dd6a742"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.12/bugster-linux.zip"
      sha256 "153461d2d92c81ac8e92d67fc4a207808a47864be440d702a8800a1182ba9ad1"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.68", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.8.12", output
    end
  end
