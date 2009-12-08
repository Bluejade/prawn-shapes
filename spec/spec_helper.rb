# encoding: utf-8
$LOAD_PATH.unshift File.join(File.dirname(__FILE__),
                             '..', 'lib')
$LOAD_PATH.unshift File.join(File.dirname(__FILE__),
                             '..', 'vendor', 'prawn-core', 'lib')
$LOAD_PATH.unshift File.join(File.dirname(__FILE__),
                             '..', 'vendor', 'pdf-inspector', 'lib')

require 'prawn/core'
require "pdf/inspector"

require "rubygems"
require "test/spec"                                                
gem 'pdf-reader', ">=0.7.3"
require "pdf/reader"          

Prawn.debug = true

def create_pdf(klass=Prawn::Document)
  @pdf = klass.new(:left_margin   => 0,
                   :right_margin  => 0,
                   :top_margin    => 0,
                   :bottom_margin => 0)
end    
