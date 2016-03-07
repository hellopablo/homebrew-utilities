require "formula"

class Esconfig < Formula
  homepage "https://github.com/hellopablo/esconfig"
  url "https://github.com/hellopablo/esconfig/releases/download/2.0.0/esconfig.phar"
  sha1 "d8a4e28a1b7c723db0cb513be17fcf131659e3d6"

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
