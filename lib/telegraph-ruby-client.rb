# frozen_string_literal: true

require 'faraday'
require 'json'
require 'logger'

require_relative 'telegraph/version'
require_relative 'telegraph/logger'
require_relative 'telegraph/config'

require_relative 'telegraph/config'
require_relative 'telegraph/errors/required_argument_error'
require_relative 'telegraph/faraday/connection'
require_relative 'telegraph/faraday/request'
require_relative 'telegraph/api/endpoints'
require_relative 'telegraph/client'
