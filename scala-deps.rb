# typed: false
# frozen_string_literal: true

class ScalaDeps < Formula
  desc "Zat Plugin to fetch the latest stable dependency version for a Scala library"
  homepage "https://github.com/ssanj/scala-deps-zatp"
  url "https://github.com/ssanj/scala-deps-zatp/archive/refs/tags/v0.6.4.tar.gz"
  version "0.6.4"
  sha256 "aa7a038e5f6e1d6c593ea1b5d5f159bf22440c5e2805c8ecf4b24933cc973b20"
  license "BSD-3-Clause"

  depends_on "rust" => :build
  depends_on "coursier"

  def install
    system "cargo", "install", *std_cargo_args
    bin.install "target/release/scala-deps"
  end

  test do
    output = shell_output("#{bin}/scala-deps -V")
    assert_equal ["scala-deps 0.6.4\n"], output.lines
  end
end
