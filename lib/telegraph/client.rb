# frozen_string_literal: true

module Telegraph
  class Client
    include Faraday::Connection
    include Faraday::Request
    include Api::Endpoints

    attr_accessor(*Config::ATTRIBUTES)

    def initialize(options = {})
      Telegraph::Config::ATTRIBUTES.each do |key|
        send("#{key}=", options.fetch(key, Telegraph.config.send(key)))
      end

      @logger ||= Telegraph::Config.logger || Telegraph::Logger.default
      @access_token ||= Telegraph.config.access_token
    end

    class << self
      def configure
        block_given? ? yield(Config) : Config
      end

      def config
        Config
      end
    end
  end
end
