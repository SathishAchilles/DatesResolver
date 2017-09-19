
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dates_resolver/version"

Gem::Specification.new do |spec|
  spec.name          = "dates_resolver"
  spec.version       = DatesResolver::VERSION
  spec.authors       = ["Sathish"]
  spec.email         = ["sathshh@gmail.com"]

  spec.summary       = %q{Splits overlapping date ranges in a neat object oriented way}
  spec.description   = %q{It consumes a collection of objects with Date ranges that are overlapping and Normalizes or splits them based on the overlaps.. returns the splitted dates as same type of objects again}
  spec.homepage      = "https://rubygems.org/gems/dates_resolver"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/gems/dates_resolver"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16.a"
  spec.add_development_dependency "rake", "~> 10.0"
end
