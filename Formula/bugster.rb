class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.8.3"
  
    depends_on "node@18"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.3/bugster-macos-intel.zip"
        sha256 "128b93e93bd77e5b0667ed9f6134f7dd5ae8cbfba7eb63d47bb64ad11347545f"
      end
  
      if Hardware::CPU.arm?
        url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.3/bugster-macos-arm64.zip"
        sha256 "0e09ced6ec0509dd824a6298bb2782b340e8402d28f2d3550ed67bc98eff9efa"
      end
    end

    on_linux do
      url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.8.3/bugster-linux.zip"
      sha256 "7bd7d0562215b80011879547b127693b21eff4b8aeb6b287a195801099697de7"
    end
  
    def install
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "--with-deps", "chrome"
      system "npx", "-y", "playwright@1.59.0-alpha-1771104257000", "install", "ffmpeg"
      system "npx", "-y", "@playwright/mcp@0.0.68", "--version" rescue nil

      bin.install "bugster"
    end
  
    test do
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.8.3", output
    end
  end
