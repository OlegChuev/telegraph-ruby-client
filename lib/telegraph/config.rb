# frozen_string_literal: true

module Telegraph
  module Config
    extend self

    ATTRIBUTES = %i[
      logger
      endpoint
      access_token
      default_max_retries
      default_retry_after
      adapter
    ].freeze

    attr_accessor(*Config::ATTRIBUTES)

    def reset
      self.endpoint = 'https://api.telegra.ph/'
      self.access_token = nil
      self.logger = nil
      self.default_max_retries = 100
      self.default_retry_after = 10
      self.adapter = ::Faraday.default_adapter
    end

    reset
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

Telegraph::Config.reset
