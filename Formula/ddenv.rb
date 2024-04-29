class Ddenv < Formula
  desc "Does nothing useful"
  homepage "https://rubygems.org/gems/ddenv"
  url "https://rubygems.org/downloads/ddenv-0.1.2.gem"
  sha256 "db14d131f23c93f217e73cbfd60555ec9fdf06565f6b3488b8def76a870f69ec"
  license "MIT"

  depends_on "ruby"
  depends_on "shadowenv"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "install", "#{name}-*.gem"
    bin.install libexec/"bin/#{name}"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/ddenv", "help"
  end
end
