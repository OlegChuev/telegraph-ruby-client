# frozen_string_literal: true

require_relative 'endpoints/account'

module Telegraph
  module Api
    module Endpoints
      include Account
    end
  end
end
