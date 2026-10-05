class Kettle < Formula
  desc "Connect Buzz Desktop to always-on Kettle agents"
  homepage "https://kettle.bot"
  version "0.2.0"

  if Hardware::CPU.arm?
    url "https://kettle.bot/download/v0.2.0/buzz-backend-kettle-darwin-arm64"
    sha256 "9974f23a913bd0de4cfae3b50dca1789b2ec7d77b2881ce32e9cea6a73e3e618"
  else
    url "https://kettle.bot/download/v0.2.0/buzz-backend-kettle-darwin-amd64"
    sha256 "7c463f94480ad8f8b63bee50660415001f8b3477b97d602e0c9a92e82dcfdd8d"
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
