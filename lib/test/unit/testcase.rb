# Define Test::Unit::TestCase as a subclass of MiniTest::Spec
# Partially "stolen" from https://github.com/metaskills/mini_specunit
module Test
  module Unit
    class TestCase < ::MiniTest::Spec

      # Ensure ActiveSupport::TestCase::Declarative doesn't override MiniTest::Spec's `describe`
      def self.method_defined?(sym, *args)
        sym.to_sym == :describe || super
      end

      def build_message(head, template=nil, *arguments)
        template &&= template.chomp
        template.gsub(/\?/) { arguments.shift.inspect.chomp }
      end

    end
  end
end
