class Ddenv < Formula
  desc "Does nothing useful"
  homepage "https://rubygems.org/gems/ddenv"
  url "https://rubygems.org/downloads/ddenv-0.1.1.gem"
  sha256 "969a9ae02e9881459276e1a6b199cb623c2b0e106f99a7fec49facc2c946c607"
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
