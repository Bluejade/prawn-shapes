# encoding: utf-8

require "rubygems"
require "bundler"
Bundler.setup

require "prawn"
require "rspec"
require "mocha"
require "pdf/reader"
require "pdf/inspector"
require 'pry'

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", "lib")



Prawn.debug = true

def create_pdf(klass=Prawn::Document)
  @pdf = klass.new(:left_margin   => 0,
                   :right_margin  => 0,
                   :top_margin    => 0,
                   :bottom_margin => 0)
end
