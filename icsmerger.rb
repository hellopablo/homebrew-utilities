require "formula"

class Icsmerger < Formula
  homepage "https://github.com/hellopablo/icsmerger"
  url "https://github.com/hellopablo/ics-merger/releases/download/1.0.0/icsmerger.phar"
  sha1 "9b1db327d1f865bde52add80b338dd1bcd000d39"

  def install
    libexec.install "icsmerger.phar"
    (libexec/"icsmerger").write <<-EOS.undent
      #!/usr/bin/env bash
      /usr/bin/env php -d allow_url_fopen=On -d detect_unicode=Off #{libexec}/icsmerger.phar $*
      EOS
    chmod 0755, (libexec/"icsmerger")
    bin.install_symlink (libexec/"icsmerger")
  end
end
