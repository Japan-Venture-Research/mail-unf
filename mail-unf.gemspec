# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mail-unf/version"

Gem::Specification.new do |s|
  s.name        = "mail-unf"
  s.version     = MailUnf::VERSION
  s.authors     = ["Yuki KODAMA"]
  s.email       = ["kodama@jvr.jp"]
  s.homepage    = "https://github.com/Japan-Venture-Research/mail-unf"
  s.description = "Normalizes utf-8 strings in a message (mail gem) into NFC using Unicode Normalization Form."
  s.summary     = "Normalizes utf-8 strings in a message (mail gem) into NFC using Unicode Normalization Form."
  s.license     = "MIT"

  s.required_ruby_version = ">= 1.9.3"

  s.add_dependency "mail", ">= 2.5.4", "<= 2.6.3"
  s.add_dependency "unf", ">= 0.1.0"

  s.files = %w(README.md Gemfile Rakefile) + Dir.glob("lib/**/*")
end
