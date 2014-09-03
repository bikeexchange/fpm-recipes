class LogstashForwarder < FPM::Cookery::Recipe
  name     'logstash-forwarder'
  version  Time.now.to_i.to_s
  source   'https://github.com/mipearson/logstash-forwarder', :with => :git

  build_depends 'go'

  def build
    inline_replace "Makefile" do |s|
      s.gsub! 'go1.[12]', 'go1.[123]'
    end
    inline_replace 'logstash-forwarder.init' do |s|
      s.gsub! 'opt\/logstash-forwarder', 'usr/bin'
    end
    make
  end

  def install
    bin.install 'build/bin/logstash-forwarder'
    etc('init.d').install_p('logstash-forwarder.init', 'logstash-forwarder')
  end
end


