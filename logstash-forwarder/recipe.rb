class LogstashForwarder < FPM::Cookery::Recipe
  name     'logstash-forwarder'
  version  Time.now.to_i.to_s
  source   'https://github.com/mipearson/logstash-forwarder', :with => :git, branch: 'MultipleConfigFiles'

  build_depends 'go'

  def build
    inline_replace "Makefile" do |s|
      s.gsub! 'go1.[12]', 'go1.[123]'
    end
    make
  end

  def install
    bin.install 'build/bin/logstash-forwarder'
    etc('init').install_p(workdir('logstash-forwarder.upstart.conf'), 'logstash-forwarder.conf')
  end
end


