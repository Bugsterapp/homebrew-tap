class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.7.14"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.14/bugster-macos-intel.zip"
        sha256 "827c8eeb630c847b6905ecb22c63856e9344ee3fd627229f1d58b1ede140ad50"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.14/bugster-macos-arm64.zip"
        sha256 "8ee8e530a0cad94881ccd9736beff8963a1930d81613fac32c76a1f5bc83e4e8"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.14/bugster-linux.zip"
      sha256 "e46946712c9175d80dd09a1a411399579fd59c4175b37a59619e9a44a2cdca4a"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1770338664000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1770338664000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.64", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.7.14", output
    end
  end
