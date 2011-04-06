# encoding: utf-8
require File.join(File.expand_path(File.dirname(__FILE__)), "spec_helper")

require 'prawn_shapes/arc'

describe 'Graphics#pie_slice' do
  it 'should work' do
    create_pdf
    @pdf.pie_slice([100, 100], :radius => 50,
                   :start_angle => 0, :end_angle => 90)
    curve = PDF::Inspector::Graphics::Curve.analyze(@pdf.render)
    curve.coords.length.should > 0
  end
end

describe 'Graphics#arc_around' do
  it 'should work' do
    create_pdf
    @pdf.arc_around([100, 100], :radius => 50,
                   :start_angle => 0, :end_angle => 90)
    curve = PDF::Inspector::Graphics::Curve.analyze(@pdf.render)
    curve.coords.length.should > 0
  end
end

describe 'Graphics#half_circle' do
  it 'should work' do
    create_pdf
    @pdf.half_circle([100, 100], :radius => 50, :side => :left)
    curve = PDF::Inspector::Graphics::Curve.analyze(@pdf.render)
    curve.coords.length.should > 0
  end
end

describe 'Graphics#quarter_circle' do
  it 'should work' do
    create_pdf
    @pdf.quarter_circle([100, 100], :radius => 50, :quadrant => 2)
    curve = PDF::Inspector::Graphics::Curve.analyze(@pdf.render)
    curve.coords.length.should > 0
  end
end
