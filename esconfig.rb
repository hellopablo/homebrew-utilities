require "formula"

class Esconfig < Formula
  homepage "https://github.com/hellopablo/esconfig"
  url "https://github.com/hellopablo/esconfig/releases/download/2.1.1/esconfig.phar"
  sha256 "505fadd020e815d041dafd1e2e72336685297e4f38973d1ce5b64f46a3eb5319"

  def install
    libexec.install "esconfig.phar"
    (libexec/"esconfig").write <<-EOS.undent
      #!/usr/bin/env bash
      /usr/bin/env php -d allow_url_fopen=On -d detect_unicode=Off #{libexec}/esconfig.phar $*
      EOS
    chmod 0755, (libexec/"esconfig")
    bin.install_symlink (libexec/"esconfig")
  end
end
