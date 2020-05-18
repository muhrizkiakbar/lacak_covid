# -*- encoding: utf-8 -*-
# stub: capistrano-locally 0.2.6 ruby lib

Gem::Specification.new do |s|
  s.name = "capistrano-locally".freeze
  s.version = "0.2.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Takuto Komazaki".freeze]
  s.bindir = "exe".freeze
  s.date = "2019-02-28"
  s.description = "Capistrano plugin to simplify \"localhost\" deployment.\n\nCapistrano can deploy the source to any hosts including localhost via SSH (`SSHKit::Backend::Netssh`).\nBut when limiting to some simple case that deployment to localhost, SSH isn't sometimes necessary.\n\nA `capistrano-locally` deploys without SSH only when a target host named \"localhost\".\n".freeze
  s.email = ["komazarari@gmail.com".freeze]
  s.homepage = "https://github.com/komazarari/capistrano-locally".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Capistrano plugin to simplify \"localhost\" deployment.".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.10"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec_junit_formatter>.freeze, [">= 0"])
    else
      s.add_dependency(%q<capistrano>.freeze, ["~> 3.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<rspec_junit_formatter>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<capistrano>.freeze, ["~> 3.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<rspec_junit_formatter>.freeze, [">= 0"])
  end
end
