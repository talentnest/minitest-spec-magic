module MiniTest::Spec::Magic::Expectations

  def self.included(base)
    base.extend ClassMethods
    super
  end


  # Tests a matcher for validity. Example:
  #
  #   class UserTest < ActiveSupport::TestCase
  #     it { should validate_presesence_of(:email) }
  #   end
  #
  # @param [Matcher] matcher the matcher to test
  def should(matcher)
    assert_accepts matcher, subject
  end

  # Tests a matcher for negative validity. Example:
  #
  #   class UserTest < ActiveSupport::TestCase
  #     it { should_not validate_presesence_of(:email) }
  #   end
  #
  # @param [Matcher] matcher the matcher to test
  def should_not(matcher)
    assert_rejects matcher, subject
  end

  module ClassMethods

    # Accepts either a matcher or a message with a block. Example:
    #
    #   class UserTest < ActiveSupport::TestCase
    #
    #     should validate_presesence_of(:email)
    #
    #     should "be valid" do
    #       subject.must_be :valid?
    #     end
    #
    #   end
    #
    # @param [Matcher|String] expectation either a matcher or a message
    def should(expectation, &block)
      message = if expectation.respond_to?(:description)
        block = lambda { should expectation }
        expectation.description
      else
        expectation
      end
      it "should #{message}", &block
    end

    # @param [Matcher] matcher a matcher
    def should_not(matcher)
      block = lambda { should_not matcher }
      it "should not #{matcher.description}", &block
    end

  end
end