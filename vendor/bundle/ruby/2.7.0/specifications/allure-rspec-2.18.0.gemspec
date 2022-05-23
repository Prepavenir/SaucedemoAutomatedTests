# -*- encoding: utf-8 -*-
# stub: allure-rspec 2.18.0 ruby lib

Gem::Specification.new do |s|
  s.name = "allure-rspec".freeze
  s.version = "2.18.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/allure-framework/allure-ruby/issues", "changelog_uri" => "https://github.com/allure-framework/allure-ruby/releases", "documentation_uri" => "https://github.com/allure-framework/allure-ruby/blob/master/allure-rspec/README.md", "rubygems_mfa_required" => "false", "source_code_uri" => "https://github.com/allure-framework/allure-ruby/tree/master/allure-rspec", "wiki_uri" => "https://github.com/allure-framework/allure-ruby/wiki" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andrejs Cunskis".freeze]
  s.date = "2022-05-23"
  s.description = "Cucumber adaptor to generate rich allure test reports".freeze
  s.email = "andrejs.cunskis@gmail.com".freeze
  s.homepage = "https://github.com/allure-framework/allure-ruby/tree/master/allure-rspec".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Allure rspec ruby adaptor".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<allure-ruby-commons>.freeze, ["= 2.18.0"])
    s.add_runtime_dependency(%q<rspec-core>.freeze, [">= 3.8", "< 4"])
  else
    s.add_dependency(%q<allure-ruby-commons>.freeze, ["= 2.18.0"])
    s.add_dependency(%q<rspec-core>.freeze, [">= 3.8", "< 4"])
  end
end
