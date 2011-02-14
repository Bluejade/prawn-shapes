# encoding: utf-8
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", "lib")

require "rubygems"

require "prawn"

require "test/spec"
require "mocha"
require "pdf/reader"
require "pdf/inspector"

Prawn.debug = true

def create_pdf(klass=Prawn::Document)
  @pdf = klass.new(:left_margin   => 0,
                   :right_margin  => 0,
                   :top_margin    => 0,
                   :bottom_margin => 0)
end    
