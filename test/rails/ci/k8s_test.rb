require "test_helper"

class Rails::Ci::K8sTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Rails::Ci::K8s::VERSION
  end

  def test_it_does_something_useful
    assert true
  end
end
