# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'speedup/version'

Gem::Specification.new do |spec|
  spec.name          = "speedup"
  spec.version       = Speedup::VERSION
  spec.authors       = ["金斌"]
  spec.email         = ["bin.jinb@qq.com"]
  spec.description   = %q{新浪微博文字极速上传}
  spec.summary       = %q{新浪微博文字极速上传}
  spec.homepage      = "https://github.com/jinbin/speedup"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
