require 'minitest/spec'
require 'test/unit/testcase'

# Define the main module
module MiniTest::Spec::Magic
end

require 'minitest/spec/magic/context'
require 'minitest/spec/magic/expectations'
require 'minitest/spec/magic/assertions'

# Extend Test::Unit::TestCase
class Test::Unit::TestCase
  extend  MiniTest::Spec::Magic::Context
  include MiniTest::Spec::Magic::Expectations
  include MiniTest::Spec::Magic::Assertions
end

# Add magic for ActionController::TestCase
if defined?(ActionController)
  require 'minitest/spec/magic/controller'

  class ActionController::TestCase
    extend MiniTest::Spec::Magic::Controller
    subject { @controller }
  end
end

# Filter backtrace with Rails.backtrace_cleaner (Rails pre 3.1.2 only)
# Shamelessly "stolen" from https://github.com/metaskills/mini_backtrace
if defined?(::Rails) && Rails::VERSION::STRING < '3.1.2' && !MiniTest.method_defined?(:filter_backtrace_with_rails)

  module MiniTest
    class << self

      def filter_backtrace_with_rails(bt)
        filter_backtrace_without_rails Rails.backtrace_cleaner.clean(bt)
      end

      alias :filter_backtrace_without_rails :filter_backtrace
      alias :filter_backtrace :filter_backtrace_with_rails

    end
  end

end
