class Ddenv < Formula
  desc "Does nothing useful"
  homepage "https://rubygems.org/gems/ddenv"
  url "https://rubygems.org/downloads/ddenv-0.1.0.gem"
  sha256 "9ba99f68b82af246c38f783a9059e3e0f910d863291e8b03b122e233584eec48"
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
