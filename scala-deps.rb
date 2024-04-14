# typed: false
# frozen_string_literal: true

class ScalaDeps < Formula
  desc "Zat Plugin to fetch the latest stable dependency version for a Scala library"
  homepage "https://github.com/ssanj/scala-deps-zatp"
  url "https://github.com/ssanj/scala-deps-zatp/archive/refs/tags/v0.6.0.tar.gz"
  version "0.6.0"
  sha256 "57f17cb584250e66b8c0f51e870273fdd614260369128563eb38f0c39d70c009"
  license "BSD-3-Clause"

  depends_on "rust" => :build
  depends_on "coursier"

  def install
    system "cargo", "install", *std_cargo_args
    bin.install "target/release/scala-deps"
  end

  test do
    output = shell_output("#{bin}/scala-deps -V")
    assert_equal ["scala-deps 0.6.0\n"], output.lines
  end
end
