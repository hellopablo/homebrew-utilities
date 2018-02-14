require "formula"

class Esconfig < Formula
  homepage "https://github.com/hellopablo/esconfig"
  url "https://github.com/hellopablo/esconfig/releases/download/2.2.0/esconfig.phar"
  sha256 "845b80ec90f4d4194e2a4b99d60c8e1b8afa82941456f3639519cd74c0e3fe03"

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
