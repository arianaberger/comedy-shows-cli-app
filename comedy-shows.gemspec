require_relative './lib/comedy_shows/version'

Gem::Specification.new do |s|
  s.name        = 'comedy-shows'
  s.version     = ComedyShows::VERSION
  s.date        = '2018-02-25'
  s.summary     = "Comedy Shows"
  s.description = "Browse the monthly comedy shows that you can see at the DC Improv"
  s.authors     = ["Ariana Berger"]
  s.email       = 'ariana.berger@gmail.com'
  s.files       = ["lib/comedy_shows.rb"]
  s.homepage    = 'http://rubygems.org/gems/comedy-shows'
  s.license     = 'MIT'
  s.executables << 'comedy-shows'

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", ">= 0"
  s.add_development_dependency "nokogiri", ">= 0"
  s.add_development_dependency "pry", ">= 0"
end
