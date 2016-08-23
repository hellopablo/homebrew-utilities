require "formula"

class Esconfig < Formula
  homepage "https://github.com/hellopablo/esconfig"
  url "https://github.com/hellopablo/esconfig/releases/download/2.0.0/esconfig.phar"
  sha256 "b091f646efc73a695b0ff62ce62632c3f1d8323eb24948642b2b52a1315c632c"

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
