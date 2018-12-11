# Rails::Ci::K8s

This gem provides an installer for a Jenkinsfile, two Dockerfiles for testing and production as well as configuration files for running in Kubernetes.  It was created to support the minikube installation created by the create\_kube script in [https://github.com/cody-nivens/kube-ci-cd-update](https://github.com/cody-nivens/kube-ci-cd-update).  
The script setup\_databases in the same project creates a test and production database and sets up
a user to access them.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails-ci-k8s', :git => 'https://github.com/cody-nivens/rails-ci-k8s.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails-ci-k8s

## Usage

```ruby
rails g ci_k8s:install --help
```
Usage:
  rails generate ci\_k8s:install [options]

Options:                                |  Values:
--------------------------------------- | -------------------------------------
  --app-namespace=APP\_NAMESPACE        |    Kubernetes Application namespace.   Default: default
  --test-namespace=TEST\_NAMESPACE      |    Kubernetes Testing namespace.   Default: app-test
  --docker-base=DOCKER\_BASE            |    Dockerfile base (plain\|wkpdf).   Default: plain
  --db-host=DB\_HOST                    |    Prod database host.   Default: mariadb-mariadb.db-apps.svc.cluster.local
  --db-port=DB\_PORT                    |    Prod database port.   Default: 3306
  --redis-host=REDIS\_HOST              |    Redis host.   Default: redis-master.default.svc.cluster.local
  --redis-port=REDIS\_PORT              |    Redis port.   Default: 6379
  --redis-test-host=REDIS\_TEST\_HOST   |    Redis test host.   Default: redis-test-master.app-test.svc.cluster.local
  --redis-test-port=REDIS\_TEST\_PORT   |    Redis test port.   Default: 6379
  --registry-host=REGISTRY\_HOST        |    Registry host.   Default: 127.0.0.1
  --registry-port=REGISTRY\_PORT        |    Registry port.   Default: 30400

Example:
```ruby
    rails generate ci_k8s:install
```

    This will create:
        # Jekinsfile
        # Dockerfile
        # Dockerfile.test
        # database.yml.prod
        # database.yml.test
        # k8s/<app_name>_deployment.yaml
        # k8s/<app_name>_service.yaml
        # k8s/<app_name>_tests_job.yaml
        # k8s/<app_name>_setup_job.yaml


## Development

After checking out the repo, run `bin/setup` to install dependencies. 
Then, run `rake test` to run the tests. 
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cody-nivens/rails-ci-k8s. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rails::Ci::K8s project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/cody-nivens/rails-ci-k8s/blob/master/CODE_OF_CONDUCT.md).
