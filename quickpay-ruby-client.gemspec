# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coolpay/version'

Gem::Specification.new do |spec|
  spec.name          = "coolpay-ruby-client"
  spec.version       = CoolPay::VERSION
  spec.authors       = ["CoolPay Developers"]
  spec.email         = ["hello@coolpay.com"]

  spec.summary       = "Ruby client for CoolPay API"
  spec.description   = "Embed CoolPay's secure payments directly into your Ruby applications. more at https://www.coolpay.com/docs/"
  spec.homepage      = "https://github.com/CoolPay/coolpay-ruby-client"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "rspec-mocks"
  spec.add_development_dependency "webmock", "~> 1.24"
  spec.add_development_dependency "pry-byebug"

  spec.add_dependency "httmultiparty", "~> 0.3.16"
end
