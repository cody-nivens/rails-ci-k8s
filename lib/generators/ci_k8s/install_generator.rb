require 'rails/generators'

module CiK8s
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)#This line added
      class_option :app_namespace, type: :string, default: 'default', desc: "Application namespace."
      class_option :test_namespace, type: :string, default: 'app-test', desc: "Testing namespace."
      class_option :redis_test_host, type: :string, default: 'redis-test-master.app-test.svc.cluster.local', desc: "Redis test host."
      class_option :redis_host, type: :string, default: 'redis-master.app-test.svc.cluster.local', desc: "Redis host."

      # copy configuration
      def copy_initializer
        template 'k8s/tests_job.yaml', "k8s/#{app_name}_tests_job.yaml"
        template 'k8s/deployment.yaml', "k8s/#{app_name}_deployment.yaml"
        template 'k8s/service.yaml', "k8s/#{app_name}_service.yaml"
        template 'k8s/setup_job.yaml', "k8s/#{app_name}_setup_job.yaml"
        template 'Jenkinsfile', "Jenkinsfile"
        template 'Dockerfile', "Dockerfile"
        template 'Dockerfile.test', "Dockerfile.test"
        template 'database.yml.prod', "database.yml.prod"
        template 'database.yml.test', "database.yml.test"
      end

      private

      def app_name
          Rails.application.class.to_s.split("::").first.underscore
      end
    end
  end
end
