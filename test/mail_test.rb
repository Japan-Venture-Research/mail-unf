# coding: utf-8

$:.unshift File.dirname(__FILE__)
require 'test_helper'
require 'unf'
require 'mail'
require 'mail-unf'

class MailTest < ActiveSupport::TestCase
  test "should normalize combining characters with NFC" do
    mail = Mail.new do
      from 'Ren' + "\u0065\u0301" + ' de Possel <rane@example.com>'
      sender 'Andr' + "\u0065\u0301" + ' Weil <andre@example.com>'
      subject 'Bourbaki: Alg' + "\u0065\u0301" + 'bre'
      body "\u0045\u0301" + 'l' + "\u0065\u0301" + 'ments de math' + "\u0065\u0301" + 'matique'
    end
    assert_equal 'UTF-8', mail.charset
    assert_equal "From: =?UTF-8?B?UmVuw6k=?= de Possel <rane@example.com>\r\n", mail[:from].encoded
    assert_equal "Sender: =?UTF-8?B?QW5kcsOp?= Weil <andre@example.com>\r\n", mail[:sender].encoded
    assert_equal "Subject: =?UTF-8?Q?Bourbaki:_Alg=C3=A9bre?=\r\n", mail[:subject].encoded
    assert_equal "Éléments de mathématique", mail.body.encoded
  end

  # reject text that doesn't have encoding UTF-8

  # test "should work with multipart email" do
  # end

  # test "should normalize combining characters with NFD" do
  # end
  # test "should normalize combining characters with NFKC" do
  # end
  # test "should normalize combining characters with NFKD" do
  # end
end
