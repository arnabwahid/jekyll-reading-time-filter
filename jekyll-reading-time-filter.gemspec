# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-reading-time-filter"
  spec.version       = File.read(File.expand_path("lib/jekyll-reading-time-filter/VERSION", __dir__)).strip
  spec.authors       = ["Your Name"]
  spec.email         = ["you@example.com"]

  spec.summary       = "A simple, configurable reading time Liquid filter for Jekyll."
  spec.description   = "Adds a {{ content | reading_time }} Liquid filter with optional seconds and custom words-per-minute."
  spec.homepage      = "https://github.com/yourname/jekyll-reading-time-filter"
  spec.license       = "MIT"

  spec.files         = Dir.glob("{lib}/**/*") + %w[LICENSE README.md]
  spec.require_paths = ["lib"]

  spec.metadata = {
    "rubygems_mfa_required" => "true",
  }

  spec.add_runtime_dependency "jekyll", ">= 3.8", "< 5.0"
end
