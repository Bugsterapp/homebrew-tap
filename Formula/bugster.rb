class Bugster < Formula
    desc "Bugster CLI"
    homepage "https://github.com/Bugsterapp/bugster-cli"
    version "0.6.7"
  
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
  
    # Opcional: si más adelante tenés builds para Linux con Homebrew/Linuxbrew
    # on_linux do
    #   url "https://github.com/Bugsterapp/bugster-cli/releases/download/v0.6.7/bugster-linux.zip"
    #   sha256 "PONÉ_ACÁ_SHA256_DE_LA_ZIP_LINUX"
    # end
  
    def install
      # Si el zip contiene solo el binario `bugster`:
      bin.install "bugster"
    end
  
    test do
      # Test muy básico para que Homebrew pueda verificar la instalación
      output = shell_output("#{bin}/bugster --version")
      assert_match "0.6.7", output
    end
  end