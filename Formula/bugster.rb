class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.8.8"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.8/bugster-macos-intel.zip"
        sha256 "24f97910452b33bec485993b3f8d5789b18325a6c674221caf47349888955ef1"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.8/bugster-macos-arm64.zip"
        sha256 "1f65ba5381a6dbf071112be980403ea5012cd206d35e8a4c8485c7a3f91c1286"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.8/bugster-linux.zip"
      sha256 "83b82fd92396d8a339df16dfba170c6e5b77a8221b6994d0226feb128d4c246d"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.68", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.8.8", output
    end
  end
