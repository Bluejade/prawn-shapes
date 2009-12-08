$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '.'))

require 'example_helper'
require 'prawn/graphics/arc'

Prawn::Document.generate("arc.pdf") do
  radius = 150
  center = [bounds.width / 2, bounds.height * 0.75]
  self.fill_color = 'ddddff'
  fill_pie_slice(center,
                    :radius => radius,
                    :start_angle => 30,
                    :end_angle => 110)
  self.fill_color = 'ffdddd'
  fill_pie_slice(center,
                    :radius => radius,
                    :start_angle => 110,
                    :end_angle => 130)
  self.fill_color = 'ddffdd'
  fill_pie_slice(center,
                    :radius => radius,
                    :start_angle => 130,
                    :end_angle => 30)
  
  self.stroke_color = '0000ff'
  stroke_arc_around(center,
                    :radius => radius,
                    :start_angle => 30,
                    :end_angle => 110)
  self.stroke_color = 'ff0000'
  stroke_arc_around(center,
                    :radius => radius,
                    :start_angle => 110,
                    :end_angle => 130)
  self.stroke_color = '00ff00'
  stroke_arc_around(center,
                    :radius => radius,
                    :start_angle => 130,
                    :end_angle => 30)

  
  center = [bounds.width / 2, bounds.height * 0.25]
  self.stroke_color = '7777777'
  self.fill_color = 'ddddff'
  fill_and_stroke_pie_slice(center,
                    :radius => radius,
                    :start_angle => 30,
                    :end_angle => 110)
  self.fill_color = 'ffdddd'
  fill_and_stroke_pie_slice(center,
                    :radius => radius,
                    :start_angle => 110,
                    :end_angle => 130)
  self.fill_color = 'ddffdd'
  fill_and_stroke_pie_slice(center,
                    :radius => radius,
                    :start_angle => 130,
                    :end_angle => 30)

end
