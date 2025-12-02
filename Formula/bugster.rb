class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.7.4"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.4/bugster-macos-intel.zip"
        sha256 "c7523a1251e556c04fdaeb6de7240421304bcf072e5a5356835002c91b024f31"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.4/bugster-macos-arm64.zip"
        sha256 "57dfe87ca730bb04e2f6f4a19224d4a1b2929e7cea0a72d5b37e3735c943a91f"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.4/bugster-linux.zip"
      sha256 "2824bac48fdd2be763d51c0ca3477b9352bfec66d634d1c52a19b2ee895e95d7"
    end
  
    def install
      system "npx", "-y", "playwright@1.58.0-alpha-2025-11-30", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.58.0-alpha-2025-11-30", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.49", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.7.4", output
    end
  end
