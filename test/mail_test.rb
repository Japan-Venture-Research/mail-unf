# coding: utf-8

$:.unshift File.dirname(__FILE__)
require 'test_helper'

class MailTest < ActiveSupport::TestCase
  test "should normalize combining characters in UTF-8 text by NFC" do
    mail = Mail.new do
      from 'Ren' + "\u0065\u0301" + ' de Possel <rane@example.com>'
      sender 'Andr' + "\u0065\u0301" + ' Weil <andre@example.com>'
      to "\u0045\u0301" + 'cole Normale Sup' + "\u0065\u0301" + 'rieure <ecole@example.com>'
      subject 'Bourbaki: Alg' + "\u0065\u0301" + 'bre'
      body "\u0045\u0301" + 'l' + "\u0065\u0301" + 'ments de math' + "\u0065\u0301" + 'matique'
    end
    assert_equal 'UTF-8', mail.charset
    assert_equal "From: =?UTF-8?B?UmVuw6k=?= de Possel <rane@example.com>\r\n", mail[:from].encoded
    assert_equal "Sender: =?UTF-8?B?QW5kcsOp?= Weil <andre@example.com>\r\n", mail[:sender].encoded
    assert_equal "To: =?UTF-8?B?w4ljb2xl?= Normale =?UTF-8?B?U3Vww6lyaWV1cmU=?= <ecole@example.com>\r\n", mail[:to].encoded
    assert_equal "Subject: =?UTF-8?Q?Bourbaki:_Alg=C3=A9bre?=\r\n", mail[:subject].encoded
    assert_equal "Éléments de mathématique", mail.body.encoded
  end

  test "should normalize combining characters in ISO-2022-JP text by NFC" do
    mail = Mail.new charset: 'ISO-2022-JP' do
      from "\u30E2\u30B7\u3099\u30CF\u3099\u30B1" + ' <mojibake@example.com>'
      sender "\u306B\u307B\u3093\u3053\u3099" + ' <nihongo@example.com>'
      to "\u30B8\u30E3\u30D1\u30CB\u30FC\u30BA" + ' <japanese@example.com>'
      subject "\u307B\u309D\u3099" + "問題ない"
    end
    assert_equal 'ISO-2022-JP', mail.charset
    assert_equal "From: モジバケ <mojibake@example.com>\r\n", decode_mime(mail[:from].encoded)
    assert_equal "From: =?ISO-2022-JP?B?GyRCJWIlOCVQJTEbKEI=?= <mojibake@example.com>\r\n", mail[:from].encoded
    assert_equal "Sender: にほんご <nihongo@example.com>\r\n", decode_mime(mail[:sender].encoded)
    assert_equal "Sender: =?ISO-2022-JP?B?GyRCJEskWyRzJDQbKEI=?= <nihongo@example.com>\r\n", mail[:sender].encoded
    assert_equal "To: ジャパニーズ <japanese@example.com>\r\n", decode_mime(mail[:to].encoded)
    assert_equal "To: =?ISO-2022-JP?B?GyRCJTglYyVRJUshPCU6GyhC?= <japanese@example.com>\r\n", mail[:to].encoded
    assert_equal "Subject: =?ISO-2022-JP?B?GyRCJFshNkxkQmokSiQkGyhC?=\r\n", mail[:subject].encoded
    assert_equal "Subject: ほゞ問題ない\r\n", decode_mime(mail[:subject].encoded)
  end

  # reject text that doesn't have encoding UTF-8

  # test "should work with multipart email" do
  # end

  # test "should normalize combining characters by NFD" do
  # end
  # test "should normalize combining characters by NFKC" do
  # end
  # test "should normalize combining characters by NFKD" do
  # end
end
