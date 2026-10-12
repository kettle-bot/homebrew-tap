class Kettle < Formula
  desc "Connect Buzz Desktop to always-on Kettle agents"
  homepage "https://kettle.bot"
  version "0.2.1"

  if Hardware::CPU.arm?
    url "https://kettle.bot/download/v0.2.1/buzz-backend-kettle-darwin-arm64"
    sha256 "d7f6082110b8e8adbcacd99759397f4489581299a704a3c354dceed56cb14b04"
  else
    url "https://kettle.bot/download/v0.2.1/buzz-backend-kettle-darwin-amd64"
    sha256 "ddb124038806ca8c28b70918a2d16fe212cd2e2a4581a4198e64ec5b6885c463"
  end

  depends_on :macos

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "buzz-backend-kettle-darwin-#{arch}" => "buzz-backend-kettle"
    chmod 0755, bin/"buzz-backend-kettle"
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/buzz-backend-kettle version").strip
  end
end
