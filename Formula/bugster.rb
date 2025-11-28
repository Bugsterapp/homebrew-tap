class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.6.7"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.6.7/bugster-macos-intel.zip"
        sha256 "d8f13bda6e6733c1b3eae3709413c21e6a06a59ad00091b22a164d4c7807b282"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.6.7/bugster-macos-arm64.zip"
        sha256 "ddb4a291be5e8937b2d790d94a0bd54dbefca17201817d50283984febacc88b1"
      end
    end
  
    def install
      system "npx", "-y", "playwright@1.58.0-alpha-17637579710009", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.58.0-alpha-1763757971000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.48", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.6.7", output
    end
  end