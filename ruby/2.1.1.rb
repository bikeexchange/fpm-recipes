class Ruby210 < FPM::Cookery::Recipe
  description 'The Ruby virtual machine'

  name 'ruby2.1'
  version '2.1.1.0'
  revision 0
  homepage 'http://www.ruby-lang.org/'
  source 'http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.1.tar.bz2'
  sha256 '96aabab4dd4a2e57dd0d28052650e6fcdc8f133fa8980d9b936814b1e93f6cfc'

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
