require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "forward_proxy"

require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require "minitest/autorun"

def with_proxy(uri, bind_address: "127.0.0.1", bind_port: 3000, threads: 32)
  proxy = ForwardProxy::Server.new(
    bind_address: bind_address,
    bind_port: bind_port
  )

  proxy_thread = Thread.new { proxy.start }

  sleep 0.050 # 50ms

  Net::HTTP.start(
    uri.hostname,
    uri.port,
    proxy.bind_address,
    proxy.bind_port,
    use_ssl: uri.scheme == 'https'
  ) do |http|
    yield http if block_given?
  end

  proxy.shutdown

  proxy_thread.join
end
