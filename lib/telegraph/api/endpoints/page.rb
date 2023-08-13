# frozen_string_literal: true

module Telegraph
  module Api
    module Endpoints
      module Page
        #
        # Use this method to create a new Telegraph page.
        #
        # @title (String, 1-256 characters)
        # @content (Array of Node, up to 64 KB)
        # @author_name (String, 0-128 characters)
        # @author_url (String, 0-512 characters)
        # @return_content (Boolean, default = false)
        #
        # On success, returns a Page object.
        def create_page(options = {})
          raise Telegraph::Errors::RequiredArgumentError.new(:title) unless options[:title]
          raise Telegraph::Errors::RequiredArgumentError.new(:content) unless options[:content]

          post('createPage', options)
        end

        # Use this method to edit an existing Telegraph page.
        #
        # @path (String)
        # @title (String, 1-256 characters)
        # @content (Array of Node, up to 64 KB)
        # @author_name (String, 0-128 characters)
        # @author_url (String, 0-512 characters)
        # @return_content (Boolean, default = false)
        #
        # On success, returns a Page object.
        def edit_page(options = {})
          raise Telegraph::Errors::RequiredArgumentError.new(:path) unless options[:path]
          raise Telegraph::Errors::RequiredArgumentError.new(:title) unless options[:title]
          raise Telegraph::Errors::RequiredArgumentError.new(:content) unless options[:content]

          post('editPage', options)
        end

        # Use this method to get a Telegraph page.
        #
        # @path (String)
        # @return_content (Boolean, default = false)
        #
        # Returns a Page object on success.
        def get_page(options = {})
          raise Telegraph::Errors::RequiredArgumentError.new(:path) unless options[:path]

          post('getPage', options)
        end
      end
    end
  end
end
