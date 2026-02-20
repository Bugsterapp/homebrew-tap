class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.7.17"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.17/bugster-macos-intel.zip"
        sha256 "761547da39dd13ce80e780ee562d9bd6b899aa3fd3bc413992bdcec44e3aee79"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.17/bugster-macos-arm64.zip"
        sha256 "030eb0ca4fbb418d99c26bb800b803daf3e056928c389557beeabe1c24f2d9d1"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.17/bugster-linux.zip"
      sha256 "6feaa9d4214b6132426065871ad1a250eae02371348b4871002a8ac2e0d428e3"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.68", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.7.17", output
    end
  end
