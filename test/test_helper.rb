$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "rails/ci/k8s"

require "minitest/autorun"
