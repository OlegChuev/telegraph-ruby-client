# frozen_string_literal: true

module Telegraph
  module Faraday
    module Request
      def get(path, options = {})
        request(:get, path, options)
      end

      def post(path, options = {})
        request(:post, path, options)
      end

      private

      # rubocop:disable Metrics/MethodLength
      def request(method, path, options)
        response = connection.send(method) do |request|
          if !access_token && path != 'createAccount'
            throw ArgumentError.new(
              'Required arguments :access_token missing.
               Use create_account to create new Account or re-initialize client with valid access_token'
            )
          end

          options.merge!(access_token: access_token)

          case method
          when :get
            request.url(path, options)
          when :post
            request.headers['Content-Type'] = 'application/json'
            request.path = path
            request.body = options.to_json unless options.empty?
          end
        end

        response.body
      end
      # rubocop:enable Metrics/MethodLength
    end
  end
end
