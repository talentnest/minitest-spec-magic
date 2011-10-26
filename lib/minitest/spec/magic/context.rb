module MiniTest::Spec::Magic::Context

  # Returns the test context. Example:
  #
  #   class UserTest < ActiveSupport::TestCase
  #     self.described_type # => User
  #
  #     describe "something" do
  #       self.described_type # => User, here too
  #     end
  #   end
  #
  # @return [Class] the described type
  def described_type
    @described_type ||= begin
      klass = self
      klass = klass.superclass while klass && klass.name !~ /Test$/
      klass.name.sub(/Test$/, '').constantize if klass
    end
  end

end