class Ccflow < Formula
  desc "CLI tool for creating and managing Claude Code workflows"
  homepage "https://github.com/Wameedh/ccflow"
  url "https://github.com/Wameedh/ccflow/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "dbcbc88ea5bfaf42a1bb0640e3f41701230a9d7b7f35df52b0a84fbc3b140335"
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
