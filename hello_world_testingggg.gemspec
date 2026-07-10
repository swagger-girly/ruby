# frozen_string_literal: true

require_relative "lib/hello_world_testingggg/version"

Gem::Specification.new do |s|
  s.name = "hello-world-testingggg"
  s.version = HelloWorldTestingggg::VERSION
  s.summary = "Ruby library to access the Hello World Testingggg API"
  s.authors = ["Hello World Testingggg"]
  s.email = "apiteam@swagger.io"
  s.homepage = "https://gemdocs.org/gems/hello-world-testingggg"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/stainless-sdks/hello-world-testingggg-ruby"
  s.metadata["rubygems_mfa_required"] = false.to_s
  s.required_ruby_version = ">= 3.2.0"

  s.files = Dir[
    "lib/**/*.rb",
    "rbi/**/*.rbi",
    "sig/**/*.rbs",
    "manifest.yaml",
    "SECURITY.md",
    "CHANGELOG.md",
    ".ignore"
  ]
  s.extra_rdoc_files = ["README.md"]
  s.add_dependency "cgi"
  s.add_dependency "connection_pool"
  s.add_dependency "standardwebhooks"
end
