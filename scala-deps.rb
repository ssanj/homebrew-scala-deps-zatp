# typed: false
# frozen_string_literal: true

class ScalaDeps < Formula
  desc "Zat Plugin to fetch the latest stable dependency version for a Scala library"
  homepage "https://github.com/ssanj/scala-deps-zatp"
  url "https://github.com/ssanj/scala-deps-zatp/archive/refs/tags/v0.6.5.tar.gz"
  version "0.6.5"
  sha256 "7a8f2863aa28fe23daa9c5759f38f753c073fada1ac2e9cacb2f2096a5554086"
  license "BSD-3-Clause"

  depends_on "rust" => :build
  depends_on "coursier"

  def install
    system "cargo", "install", *std_cargo_args
    bin.install "target/release/scala-deps"
  end

  test do
    output = shell_output("#{bin}/scala-deps -V")
    assert_equal ["scala-deps 0.6.5\n"], output.lines
  end
end
