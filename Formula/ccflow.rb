class Ccflow < Formula
  desc "CLI tool for creating and managing Claude Code workflows"
  homepage "https://github.com/Wameedh/ccflow"
  url "https://github.com/Wameedh/ccflow/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "f45439a0ab298cd3aa9716eae84a657a507116b3860f63f3e2900983713ffe35"
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
