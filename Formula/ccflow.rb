class Ccflow < Formula
  desc "CLI tool for creating and managing Claude Code workflows"
  homepage "https://github.com/Wameedh/ccflow"
  url "https://github.com/Wameedh/ccflow/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "0a0acc2892303dea76730a853e67a8e6d4584a5a16c715dca04815610bda08f1"
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
