 # encoding: utf-8
require File.join(File.expand_path(File.dirname(__FILE__)), "spec_helper")

require 'prawn_shapes/star'

describe 'Graphics#star' do
  it 'should work' do
    create_pdf
    @pdf.star([100, 100], :radius => 50)
    line_drawing = PDF::Inspector::Graphics::Line.analyze(@pdf.render)
    line_drawing.points.length.should == 11
  end
end

describe 'Graphics#half_star' do
  it ':left side should work' do
    create_pdf
    @pdf.half_star([100, 100], :radius => 50, :side => :left)
    line_drawing = PDF::Inspector::Graphics::Line.analyze(@pdf.render)
    line_drawing.points.length.should == 7
  end
  it ':right side should work' do
    create_pdf
    @pdf.half_star([100, 100], :radius => 50, :side => :right)
    line_drawing = PDF::Inspector::Graphics::Line.analyze(@pdf.render)
    line_drawing.points.length.should == 7
  end
end

