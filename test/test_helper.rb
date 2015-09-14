require 'rubygems'
require 'active_support'
require 'minitest/autorun'

require 'nkf'
require 'unf'
require 'mail'

# NOTE: requiring order is important
require 'mail-iso-2022-jp'
require 'mail-unf'

$:.unshift File.dirname(__FILE__) + '/..'
$:.unshift File.dirname(__FILE__)
$:.unshift File.dirname(__FILE__) + '/../lib'

def decode_mime str
  NKF.nkf '-w', str
end
