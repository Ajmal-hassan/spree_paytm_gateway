# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'spree_paytm/version'
Gem::Specification.new do |s|
  s.platform              = Gem::Platform::RUBY
  s.name                  = 'spree_paytm'
  s.version               = SpreePaytm::VERSION
  s.summary               = 'Paytm integration into spree application.'
  s.description           = s.summary
  s.required_ruby_version = '>= 2.1.0'

  s.author    = 'Nirankar Singh'
  s.email     = 'nirankarsingh247@gmail.com'
  s.homepage  = 'https://github.com/niri4/spree_paytm_gateway'

  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core'
end
