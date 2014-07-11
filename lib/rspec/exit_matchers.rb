require "rspec/exit_matchers/version"

# expect { exit(1) }.to exit_with_status(1)
module Rspec
  module ExitMatchers
    class ExitWithStatus

      def initialize(&block)
        @block = block
      end

      def matches?(actual)
        @actual = actual
        begin
          @block.call
        rescue SystemExit => e
          @exit_status = e.status
        end
        @exit_status && actual == @exit_status
      end

      def failure_message_for_should
        "expected block to exit with status #{@actual}, but it did not"
      end

      def supports_block_expectations?
        true
      end
    end

    def exit_with_status(&block)
      ExitWithStatus.new &block
    end
  end
end

RSpec::configure do |config|
  config.include(Rspec::ExitMatchers)
end
