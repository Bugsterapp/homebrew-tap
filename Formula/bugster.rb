class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.8.2"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.2/bugster-macos-intel.zip"
        sha256 "99ce060135e468e09f6a77454efde41ce66e9cb8f34ef501ef9ef41a287faf8f"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.2/bugster-macos-arm64.zip"
        sha256 "9bfc36086dd12d477088c2eedeef40daf4383b1b00d8a179f53bfd9feb7c6a30"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.2/bugster-linux.zip"
      sha256 "8461981d9a2a0481092be9b427e4aae859f01382da3c6dff8e2e73b708b53ebf"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.68", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.8.2", output
    end
  end
