# frozen_string_literal: true

module Telegraph
  module Errors
    class RequiredArgumentError < ArgumentError
      attr_reader :argument

      def initialize(argument)
        @argument = argument
        msg = "Required arguments :#{argument} missing."

        super(msg)
      end
    end
  end
end
