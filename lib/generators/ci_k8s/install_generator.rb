require 'rails/generators'

module CiK8s
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)#This line added

      class_option :app_namespace, type: :string, default: 'default', desc: "Kubernetes Application namespace."
      class_option :test_namespace, type: :string, default: 'app-test', desc: "Kubernetes Testing namespace."
      class_option :db_host, type: :string, default: 'mariadb-mariadb.db-apps.svc.cluster.local', desc: "Prod database host."
      class_option :db_port, type: :string, default: '3306', desc: "Prod database port."
      class_option :redis_host, type: :string, default: 'redis-master.default.svc.cluster.local', desc: "Redis host."
      class_option :redis_port, type: :string, default: '6379', desc: "Redis port."
      class_option :redis_test_host, type: :string, default: 'redis-master.app-test.svc.cluster.local', desc: "Redis test host."
      class_option :redis_test_port, type: :string, default: '6379', desc: "Redis test port."
      class_option :registry_host, type: :string, default: '127.0.0.1', desc: "Registry host."
      class_option :registry_port, type: :string, default: '30400', desc: "Registry port."

      # adds Jenkins, Docker and Kubernetes config files to the application
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

      def app_namespace
        options[:app_namespace]
      end
      def test_namespace
        options[:test_namespace]
      end
      def db_host
        options[:db_host]
      end
      def db_port
        options[:db_port]
      end
      def redis_test_host
        options[:redis_test_host]
      end
      def redis_test_port
        options[:redis_test_port]
      end
      def redis_host
        options[:redis_host]
      end
      def redis_port
        options[:redis_port]
      end
      def registry_host
        options[:registry_host]
      end
      def registry_port
        options[:registry_port]
      end
      def app_name
          Rails.application.class.to_s.split("::").first.underscore
      end
    end
  end
end
