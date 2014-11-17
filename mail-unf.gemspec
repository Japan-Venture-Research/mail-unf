# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mail-unf/version"

Gem::Specification.new do |s|
  s.name        = "mail-unf"
  s.version     = MailUnf::VERSION
  s.authors     = ["Yuki KODAMA"]
  s.email       = ["kodama@jvr.jp"]
  s.homepage    = "https://github.com/Japan-Venture-Research/mail-unf"
  s.description = ""
  s.summary     = ""
  s.license     = "MIT"

  s.required_ruby_version = ">= 1.9.2"

  s.add_dependency "mail", ">= 2.2.6", "<= 2.6.1"
  s.add_dependency "unf", ">= 0.1.0"
  s.add_development_dependency "actionmailer", ">= 3.0.0"
  s.add_development_dependency "rdoc", ">= 3.12"

  s.files = %w(README.md Gemfile) + Dir.glob("lib/**/*")
end
