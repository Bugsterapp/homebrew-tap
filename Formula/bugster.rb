class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.8.9"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.9/bugster-macos-intel.zip"
        sha256 "8fa0addbad79ef06ef4a338fa87d05aa87a8dbcccccbc8834e2921231ff6c027"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.9/bugster-macos-arm64.zip"
        sha256 "7340905ed30b4c71f1ef6ac9524422cfb81adf59a133ca39e41741314b49c6e2"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.9/bugster-linux.zip"
      sha256 "643279e832f79bddad21dbde4e197c5372e51ba6c5ddd57dfde0c5ca3dcefc04"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.68", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.8.9", output
    end
  end
