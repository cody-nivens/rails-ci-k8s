require 'test_helper'
require 'generators/ci_k8s/install_generator'
require "rails/generators/test_case"

class CiK8s::InstallGeneratorTest < Rails::Generators::TestCase
  include GeneratorTestHelpers


  tests CiK8s::Generators::InstallGenerator
  destination File.expand_path("../../dummy", File.dirname(__FILE__))

  create_generator_sample_app


  Minitest.after_run do
    remove_generator_sample_app
  end

  test "generator runs without errors" do
      run_generator
      assert_file "k8s/test_app_tests_job.yaml" do |content|
      assert_match(/test_app/, content)
    end

  end
end

