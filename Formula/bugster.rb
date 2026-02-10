class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.7.12"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.12/bugster-macos-intel.zip"
        sha256 "8e75bf6c9421a924831f249cae33a9be09c214cac61110a8e7f266db8d9b3493"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.12/bugster-macos-arm64.zip"
        sha256 "ec73f5a7403bfe60362ff75574df76432d9243f535616ecf7926569716181809"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.7.12/bugster-linux.zip"
      sha256 "080fd9fb85ccea38856fe2bc97ad15632e83967d8bea1e9bd63e7c41f9635590"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1770338664000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1770338664000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.64", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.7.12", output
    end
  end
