# frozen_string_literal: true

module Telegraph
  module Api
    module Endpoints
      module Account
        #
        # Use this method to create a new Telegraph account.
        # Most users only need one account, but this can be useful for channel administrators,
        # who would like to keep individual author names and profile links for each of their channels.
        #
        # @short_name (String, 1-32 characters)
        # @author_name (String, 0-128 characters)
        # @author_url (String, 0-512 characters)
        #
        # On success, returns an Account object with the regular fields and an additional access_token field.
        def create_account(options = {})
          raise Telegraph::Errors::RequiredArgumentError.new(:short_name) unless options[:short_name]

          response = post('createAccount', options)
          self.access_token = response.dig('result', 'access_token')

          response
        end

        #
        # Use this method to get information about a Telegraph account.
        #
        # @fields (Array of String, default = [“short_name”,“author_name”,“author_url”])
        # Available fields: short_name, author_name, author_url, auth_url, page_count
        #
        # Returns an Account object on success.
        def get_account_info(options = {})
          raise Telegraph::Errors::RequiredArgumentError.new(:short_name) unless options[:short_name]

          get('getAccountInfo', options)
        end

        #
        # Use this method to update information about a Telegraph account.
        # Pass only the parameters that you want to edit.
        #
        # @short_name (String, 1-32 characters)
        # @author_name (String, 0-128 characters)
        # @author_url (String, 0-512 characters)
        #
        # On success, returns an Account object with the default fields.
        def edit_account_info(options = {})
          post('editAccountInfo', options)
        end

        # Use this method to revoke access_token and generate a new one,
        # for example, if the user would like to reset all connected sessions,
        # or you have reasons to believe the token was compromised.
        #
        # On success, returns an Account object with new access_token and auth_url fields.
        def revoke_access_token
          response = post('revokeAccessToken')
          self.access_token = response.dig('result', 'access_token')

          response
        end
      end
    end
  end
end
