# typed: false
# frozen_string_literal: true

class ScalaDeps < Formula
  desc "Zat Plugin to fetch the latest stable dependency version for a Scala library"
  homepage "https://github.com/ssanj/scala-deps-zatp"
  url "https://github.com/ssanj/scala-deps-zatp/archive/refs/tags/v0.6.2.tar.gz"
  version "0.6.2"
  sha256 "0908d11a2e8f7981c569d72acb26be000eee70579e03e3fef2cf7e92cd9e51e7"
  license "BSD-3-Clause"

  depends_on "rust" => :build
  depends_on "coursier"

  def install
    system "cargo", "install", *std_cargo_args
    bin.install "target/release/scala-deps"
  end

  test do
    output = shell_output("#{bin}/scala-deps -V")
    assert_equal ["scala-deps 0.6.2\n"], output.lines
  end
end
