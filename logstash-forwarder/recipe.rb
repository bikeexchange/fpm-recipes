class LogstashForwarder < FPM::Cookery::Recipe
  name     'logstash-forwarder'
  version  Time.now.to_i.to_s
  source   'https://github.com/elasticsearch/logstash-forwarder', :with => :git

  build_depends 'golang'
  
  def build
    make
  end

  def install
    bin.install 'build/bin/logstash-forwarder'
  end
end
