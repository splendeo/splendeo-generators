Gem::Specification.new do |s|
  s.name = "splendeo-generators"
  s.summary = "A collection of useful Rails generator scripts."
  s.description = "A fork of ryanb's nifty-generators, with i18n and blueprint."
  s.homepage = "http://github.com/splendeo/splendeo-generators"
  
  s.version = "0.1.0"
  s.date = "2010-02-16"
  
  s.authors = ["Ryan Bates", "Enrique Garcia Cota"]
  s.email = "egarcia@splendeo.es"
  
  s.require_paths = ["lib"]
  s.files = Dir["lib/**/*"] + Dir["test/**/*"] + Dir["rails_generators/**/*"] + ["LICENSE", "README.rdoc", "Rakefile", "CHANGELOG"]
  s.extra_rdoc_files = ["README.rdoc", "CHANGELOG", "LICENSE"]
  
  s.has_rdoc = true
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "NiftyGenerators", "--main", "README.rdoc"]
  
  s.rubygems_version = "1.3.4"
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2")
end
