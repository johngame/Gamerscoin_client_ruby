require 'gamerscoin_client/version'
require 'gamerscoin_client/client'

class GamerscoinClient

  def initialize(options = {})
    @client = GamerscoinClient::Client.new(options)
  end

  # Delegate everything to the 'real' Client
  def method_missing(name, *args)
    @client.send(name, *args)
  end

  def self.configuration
    @configuration ||=  Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

  class Configuration
    attr_accessor :host, :port, :protocol, :user, :password

    def initialize
      self.host = 'localhost'
      self.port = 40001
      self.protocol = :http
      self.user = ''
      self.password = ''
    end

  end

end
