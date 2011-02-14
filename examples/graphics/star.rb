$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", ".."))
require 'examples/example_helper'
require 'prawn/graphics/star'

Prawn::Document.generate("star.pdf") do
  self.stroke_color = '0000ff'
  stroke_star([bounds.width / 2, bounds.height * 0.75], :radius => 72)
  self.fill_color = '99ff99'
  fill_half_star([bounds.width / 2, bounds.height / 2],
                 :radius => 72, :side => :left)
  self.fill_color = '9999ff'
  fill_half_star([bounds.width / 2, bounds.height / 2],
                 :radius => 72, :side => :right)
  fill_and_stroke_star([bounds.width / 2, bounds.height * 0.25], :radius => 72)
end
