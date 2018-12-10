$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "rails/ci/k8s"

require "minitest/autorun"
require "abstract_unit"

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
