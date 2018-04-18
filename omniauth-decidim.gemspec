
# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth/decidim/version"

Gem::Specification.new do |spec|
  spec.name = "omniauth-decidim"
  spec.version = Omniauth::Decidim::VERSION
  spec.authors = ["Oriol Gual"]
  spec.email = ["oriol@codegram.com"]

  spec.summary = "OmniAuth strategy for Decidim"
  spec.description = "OmniAuth strategy for Decidim"
  spec.homepage = "https://github.com/decidim/omniauth-decidim"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth", "~> 1.5"
  spec.add_dependency "omniauth-oauth2", ">= 1.4.0", "< 2.0"
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
