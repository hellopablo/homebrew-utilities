require "formula"

class Esconfig < Formula
  homepage "https://github.com/hellopablo/esconfig"
  url "https://github.com/hellopablo/esconfig/releases/download/2.2.0/esconfig.phar"
  sha256 "fc365e92ceec553863e021fe614ba2f2f0aa1dc8fb843b1f112aa793417dd548"

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
