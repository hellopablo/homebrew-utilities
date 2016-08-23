require "formula"

class Icsmerger < Formula
  homepage "https://github.com/hellopablo/icsmerger"
  url "https://github.com/hellopablo/ics-merger/releases/download/1.0.0/icsmerger.phar"
  sha256 "62b3a4753ce4ce2dc011568f8a04c20c6eeb95b25867ba27345280e6ebd50f20"

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
