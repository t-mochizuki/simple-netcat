lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "simple_netcat"
  spec.version       = "0.0.1"
  spec.authors       = ["Takamasa Mochizuki"]
  spec.email         = ["t-mochizuki@users.noreply.github.com"]

  spec.summary       = %q{SimpleNetcat assists in making HTTP requests}
  spec.homepage      = "https://github.com/t-mochizuki/simple_netcat"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "0.9.6"
  spec.add_development_dependency "test-unit", "2.0.0.0"
  spec.add_development_dependency "sinatra", "1.4.7"
end
