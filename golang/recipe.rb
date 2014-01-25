class Golang < FPM::Cookery::Recipe
  description 'golang'

  name 'go'
  version '1.2'
  homepage 'http://golang.org/'
  source "http://go.googlecode.com/files/go#{version}.linux-amd64.tar.gz"
  sha1 '664e5025eae91412a96a10f4ed1a8af6f0f32b7d'

  config_files '/etc/profile.d/go.sh'

  conflicts 'golang', 'golang-go', 'golang-src', 'golang-doc'
  replaces 'golang', 'golang-go', 'golang-src', 'golang-doc'

  def build
  end

  def install
    mkdir_p share
    cp_r builddir('go'), share('go')

    etc('profile.d').install workdir('go.profile'), 'go.sh'
  end
end
