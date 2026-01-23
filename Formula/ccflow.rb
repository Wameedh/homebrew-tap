class Ccflow < Formula
  desc "CLI tool for creating and managing Claude Code workflows"
  homepage "https://github.com/Wameedh/ccflow"
  url "https://github.com/Wameedh/ccflow/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "306fd6f60f05fd4ee5990232341201d251c22407d5b37fb91ea680a307f9c422"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/Wameedh/ccflow/internal/config.Version=#{version}
      -X github.com/Wameedh/ccflow/internal/config.BuildTime=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match "ccflow version", shell_output("#{bin}/ccflow version")
  end
end
