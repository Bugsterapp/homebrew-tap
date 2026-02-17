class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.7.16"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.16/bugster-macos-intel.zip"
        sha256 "9026eb3531bd369b87bfcecccc6f51c6cc19c46d5df98f6a8061d77acfb74793"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.16/bugster-macos-arm64.zip"
        sha256 "ad332be0877ae97b0510fee922c0de3736681c6ddee7fa48aa82ef23a7e68e78"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.16/bugster-linux.zip"
      sha256 "cf0709b95ea12b57d3f942dd7994535302c792e41f3ec26f283f5438ae6f7bc7"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.68", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.7.16", output
    end
  end
