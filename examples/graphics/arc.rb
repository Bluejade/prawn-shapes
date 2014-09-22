$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", ".."))
require 'examples/example_helper'
require 'prawn_shapes/arc'

Prawn::Document.generate("arc.pdf") do
  radius = 75
  center = [bounds.width * 0.25, bounds.height * 0.85]
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


  center = [bounds.width * 0.75, bounds.height * 0.85]
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



  center = [bounds.width * 0.5, bounds.height * 0.725]
  self.stroke_color = '7777777'
  self.fill_color = 'ddddff'
  fill_pie_slice(center,
                :radius => radius,
                :start_angle => 0,
                :end_angle => 360)
  stroke_arc_around(center,
                :radius => radius,
                :start_angle => 0,
                :end_angle => 360)



  ####### Semi-Circles
  center = [bounds.width * 0.25, bounds.height * 0.60]

  self.fill_color = 'ddddff'
  fill_half_circle(center, :radius => radius, :side => :left)
  self.fill_color = 'ffdddd'
  fill_half_circle(center, :radius => radius, :side => :right)

  self.stroke_color = '0000ff'
  stroke_half_circle(center, :radius => radius, :side => :left)
  self.stroke_color = 'ff0000'
  stroke_half_circle(center, :radius => radius, :side => :right)
  ####### end:Semi-Circles

  ####### Quarter-Circles
  center = [bounds.width * 0.75, bounds.height * 0.60]

  self.fill_color = 'ddddff'
  fill_quarter_circle(center, :radius => radius, :quadrant => 1)
  self.fill_color = 'ffdddd'
  fill_quarter_circle(center, :radius => radius, :quadrant => 2)
  self.fill_color = 'ddffdd'
  fill_quarter_circle(center, :radius => radius, :quadrant => 3)
  self.fill_color = 'ddffff'
  fill_quarter_circle(center, :radius => radius, :quadrant => 4)

  self.stroke_color = '0000ff'
  stroke_quarter_circle(center, :radius => radius, :quadrant => 1)
  self.stroke_color = 'ff0000'
  stroke_quarter_circle(center, :radius => radius, :quadrant => 2)
  self.stroke_color = '00ff00'
  stroke_quarter_circle(center, :radius => radius, :quadrant => 3)
  self.stroke_color = '00ffff'
  stroke_quarter_circle(center, :radius => radius, :quadrant => 4)

  ####### end:Quarter-Circles


  self.fill_color = '333333'
  text_box('Notice the difference in stroking when ' +
           'using stroke_ versus fill_and_stroke:',
           :at => [0, bounds.height * 0.30 + radius + 20],
           :align => :center)

  center = [bounds.width * 0.25, bounds.height * 0.30]
  self.fill_color = 'ddddff'
  stroke_quarter_circle(center,
                                 :radius => radius,
                                 :quadrant => 1)

  center = [bounds.width * 0.75, bounds.height * 0.30]
  self.fill_color = 'ffffff'
  fill_and_stroke_quarter_circle(center,
                                 :radius => radius,
                                 :quadrant => 1)




  self.fill_color = '333333'
  text_box('If you want to stroke both sides when stroking ' +
           'include :stroke_both_sides => true',
           :at => [0, bounds.height * 0.15 + radius + 20],
           :align => :center)

  center = [bounds.width * 0.5, bounds.height * 0.15]
  stroke_quarter_circle(center,
                        :radius => radius,
                        :quadrant => 1,
                        :stroke_both_sides => true)

end
