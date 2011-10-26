module MiniTest::Spec::Magic::Controller

  # @override fallback on described_type
  def determine_default_controller_class(name)
    name.sub(/Test$/, '').constantize
  rescue NameError
    described_type
  end

end
