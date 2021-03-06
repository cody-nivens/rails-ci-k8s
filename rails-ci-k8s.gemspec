
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rails/ci/k8s/version"

Gem::Specification.new do |spec|
  spec.name          = "rails-ci-k8s"
  spec.version       = Rails::Ci::K8s::VERSION
  spec.authors       = ["Cody Nivens"]
  spec.email         = ["cody.nivens@gmail.com"]

  spec.summary       = %q{Creates Jinkensfile, Dockerfiles and Kubernetes control files.}
  spec.description   = %q{This gem generates a Jenkinsfile which uses two Dockerfiles to create two images of a Rails application in Kubernetes.}
  spec.homepage      = "https://github.com/cody-nivens/rails-ci-k8s.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1.2"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rails", "~> 5.2"
  spec.add_development_dependency "rack", ">= 2.2.3"
end
