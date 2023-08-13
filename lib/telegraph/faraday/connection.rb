# frozen_string_literal: true

module Telegraph
  module Faraday
    module Connection
      private

      # rubocop:disable Metrics/MethodLength
      def connection
        @connection ||=
          begin
            options = {
              headers: { 'Accept' => 'application/json; charset=utf-8' },
              request: {}
            }

            ::Faraday::Connection.new(endpoint, options) do |connection|
              connection.use ::Faraday::Request::UrlEncoded
              # connection.use ::Notion::Faraday::Response::RaiseError
              connection.use ::Faraday::Response::Json
              connection.response :logger, logger if logger
              connection.adapter adapter
            end
          end
      end
      # rubocop:enable Metrics/MethodLength
    end
  end
end
