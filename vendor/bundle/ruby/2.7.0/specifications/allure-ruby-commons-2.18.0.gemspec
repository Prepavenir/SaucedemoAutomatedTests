# -*- encoding: utf-8 -*-
# stub: allure-ruby-commons 2.18.0 ruby lib

Gem::Specification.new do |s|
  s.name = "allure-ruby-commons".freeze
  s.version = "2.18.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/allure-framework/allure-ruby/issues", "changelog_uri" => "https://github.com/allure-framework/allure-ruby/releases", "documentation_uri" => "https://github.com/allure-framework/allure-ruby/blob/master/allure-ruby-commons/README.md", "rubygems_mfa_required" => "false", "source_code_uri" => "https://github.com/allure-framework/allure-ruby/tree/master/allure-ruby-commons", "wiki_uri" => "https://github.com/allure-framework/allure-ruby/wiki" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andrejs Cunskis".freeze]
  s.date = "2022-05-23"
  s.description = "Utilities allowing to implement allure result generation by other test frameworks".freeze
  s.email = "andrejs.cunskis@gmail.com".freeze
  s.homepage = "https://github.com/allure-framework/allure-ruby".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Common library for allure results generation".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<mime-types>.freeze, [">= 3.3", "< 4"])
    s.add_runtime_dependency(%q<oj>.freeze, [">= 3.10", "< 4"])
    s.add_runtime_dependency(%q<require_all>.freeze, [">= 2", "< 4"])
    s.add_runtime_dependency(%q<uuid>.freeze, [">= 2.3", "< 3"])
  else
    s.add_dependency(%q<mime-types>.freeze, [">= 3.3", "< 4"])
    s.add_dependency(%q<oj>.freeze, [">= 3.10", "< 4"])
    s.add_dependency(%q<require_all>.freeze, [">= 2", "< 4"])
    s.add_dependency(%q<uuid>.freeze, [">= 2.3", "< 3"])
  end
end
