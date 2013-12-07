#! /usr/bin/env ruby
# coding: utf-8

require 'nokogiri'
require 'open-uri'
require 'pp'
require 'twitter'
require 'yaml'

case ARGV[0]
when 'production'
  CRON_ENV = 'production'
else
  CRON_ENV = 'development'
end

base_path   = File.expand_path(File.dirname(__FILE__));
config_file = base_path + '/config.yml'
config      = YAML.load_file(config_file)[CRON_ENV]

Twitter.configure do |t|
  t.consumer_key       = config['consumer_key']
  t.consumer_secret    = config['consumer_secret']
  t.oauth_token        = config['oauth_token']
  t.oauth_token_secret = config['oauth_token_secret']
end

doc = Nokogiri::HTML(open('http://info.finance.yahoo.co.jp/exchange/convert/?a=1&s=SGD&t=JPY'))
doc.search('td.noLine').each do |tag|
  Twitter.update("SGDJPY = #{tag.content}")
  break;
end

