class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.7.10"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.10/bugster-macos-intel.zip"
        sha256 "07bb6da39b3a12c36be4491324612f69aee1774a3bcc7e1a42159c05e9092f84"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.10/bugster-macos-arm64.zip"
        sha256 "1f5acf2b93dd483102c4b7b7f327eb0e30a11460b7666240e525ad29c4f0234f"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.10/bugster-linux.zip"
      sha256 "b1bcca6226c4b19985d064b9572c0e3541441b01fc33d4ccaa92399614ba9dc5"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1769819922000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1769819922000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.62", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.7.10", output
    end
  end
