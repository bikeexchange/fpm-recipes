class Golang < FPM::Cookery::Recipe
  description 'golang'

  name 'go'
  version '1.3.1'
  homepage 'http://golang.org/'
  source "http://golang.org/dl/go#{version}.src.tar.gz"
  sha1 'bc296c9c305bacfbd7bff9e1b54f6f66ae421e6e'


  conflicts 'golang', 'golang-go', 'golang-src', 'golang-doc'
  replaces 'golang', 'golang-go', 'golang-src', 'golang-doc'

  def build
    ENV['GOROOT_FINAL'] = '/usr/share/go'
    Dir.chdir 'src' do
      safesystem './all.bash'
    end
  end

  def install
    mkdir_p share
    cp_r builddir('go'), share('go')
    bin.install 'bin/go'
    bin.install 'bin/gofmt'
  end
end
