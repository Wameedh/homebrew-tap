class Ccflow < Formula
  desc "CLI tool for creating and managing Claude Code workflows"
  homepage "https://github.com/Wameedh/ccflow"
  url "https://github.com/Wameedh/ccflow/archive/refs/tags/v0.6.2.tar.gz"
  sha256 "e9af18f8bddd3669cc43ca10e28544f90be2d85aab7039760835a73014c4efff"
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
