# frozen_string_literal: true

module Telegraph
  module Api
    module Endpoints
      module PageList
        #
        # Use this method to get a list of pages belonging to a Telegraph account.
        #
        # @offset (Integer, default = 0)
        # @limit (Integer, 0-200, default = 50)
        #
        # Returns a PageList object, sorted by most recently created pages first.
        def get_page_list(options = {})
          post('getPageList', options)
        end
      end
    end
  end
end
