# coding: utf-8

require 'nokogiri'
require 'open-uri'
require 'twitter'
require 'pp'

Twitter.configure do |t|
  t.consumer_key       = ''
  t.consumer_secret    = ''
  t.oauth_token        = ''
  t.oauth_token_secret = ''
end

doc = Nokogiri::HTML(open('http://info.finance.yahoo.co.jp/exchange/convert/?a=1&s=SGD&t=JPY'))
doc.search('//td/strong').each do |tag|
  Twitter.update("SGDJPY = #{tag.content}")
  break;
end

