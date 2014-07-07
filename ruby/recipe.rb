class Ruby210 < FPM::Cookery::Recipe
  description 'The Ruby virtual machine'

  name 'ruby2.1'
  version '2.1.2'
  revision 0
  homepage 'http://www.ruby-lang.org/'
  source "http://cache.ruby-lang.org/pub/ruby/2.1/ruby-#{version}.tar.bz2"
  sha256 '6948b02570cdfb89a8313675d4aa665405900e27423db408401473f30fc6e901'

  section 'interpreters'

  build_depends 'autoconf', 'libreadline6-dev', 'bison', 'zlib1g-dev',
                'libssl-dev', 'libyaml-dev'

  depends 'libffi6', 'libncurses5', 'libreadline6', 'libssl1.0.0',
          'libtinfo5', 'libyaml-0-2', 'zlib1g'

  def build
    configure :prefix => prefix, 'disable-install-doc' => true
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
