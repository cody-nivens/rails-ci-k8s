module GeneratorTestHelpers
  def self.included(base)
    base.extend ClassMethods
  end

  def evaluate_erb_asset_template(template)
    engine = ::ERB.new(template)
    asset_binding = asset_context_class.new.context_binding
    engine.result(asset_binding)
  end

  def asset_context_class
    Class.new do
      def image_path(name)
        "/assets/#{name}"
      end

      def context_binding
        binding
      end
    end
  end

  module ClassMethods
    def test_path
      File.join(File.dirname(__FILE__), "..")
    end

    def create_generator_sample_app
      FileUtils.cd(test_path) do
        system "rm -f dummy/.gitignore"
        system "rails new dummy --skip-active-record --skip-test-unit --skip-spring --skip-bundle --quiet"
      end
    end

    def remove_generator_sample_app
      FileUtils.cd(test_path) do
        system "rm -f dummy/.gitignore"
      end
      #FileUtils.rm_rf(test_path)
    end
  end
end
