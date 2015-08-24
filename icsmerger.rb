require "formula"

class Icsmerger < Formula
  homepage "https://github.com/hellopablo/icsmerger"
  url "https://github.com/hellopablo/ics-merger/releases/download/1.0.0/icsmerger.phar"
  sha1 "9b1db327d1f865bde52add80b338dd1bcd000d39"

  def install
    prefix.install "icsmerger.phar"
    bin.install_symlink prefix/"icsmerger.phar"
  end
end
