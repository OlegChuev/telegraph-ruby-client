# frozen_string_literal: true

module Telegraph
  module Api
    module Endpoints
      module PageView
        #
        # Use this method to get the number of views for a Telegraph article.
        #
        # @path (String)
        # @year (Integer, 2000-2100)
        # @month (Integer, 1-12)
        # @day (Integer, 1-31)
        # @hour (Integer, 0-24)
        #
        # Returns a PageViews object on success.
        # By default, the total number of page views will be returned.
        def get_views(options = {})
          raise Telegraph::Errors::RequiredArgumentError.new(:path) unless options[:path]
          raise Telegraph::Errors::RequiredArgumentError.new(:year) unless options[:year]
          raise Telegraph::Errors::RequiredArgumentError.new(:month) unless options[:month]
          raise Telegraph::Errors::RequiredArgumentError.new(:day) unless options[:day]

          post('getViews', options)
        end
      end
    end
  end
end
