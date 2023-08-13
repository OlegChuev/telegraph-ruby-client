# frozen_string_literal: true

require 'logger'

module Telegraph
  class Logger < ::Logger
    def self.default
      return @default if @default

      logger = new $stdout
      logger.level = Logger::WARN
      @default = logger
    end
  end
end
