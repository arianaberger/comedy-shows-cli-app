lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "comedy_shows/version"

Gem::Specification.new do |spec|
  spec.name          = "comedy-shows"
  spec.version       = ComedyShows::VERSION
  spec.authors       = ["Ariana Berger"]
  spec.email         = ["ariana.berger@gmail.com"]

  spec.summary       = %q{Browse the monthly comedy shows that you can see at the DC Improv.}
  spec.description   = %q{Browse the monthly comedy shows that you can see at the DC Improv.}
  spec.homepage      = "https://github.com/arianaberger/comedy-shows-cli-app"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = ["comedy-shows"]
  spec.require_paths = ["lib", "lib/comedy_shows"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri"
end
