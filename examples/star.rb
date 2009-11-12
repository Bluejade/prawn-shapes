$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '.'))

require 'example_helper'
require 'prawn/graphics/star'

Prawn::Document.generate("star.pdf") do
  self.fill_color = '99ff99'
  self.stroke_color = '0000ff'
  fill_star([bounds.width / 2, bounds.height * 0.75], :radius => 72)
  fill_and_stroke_star([bounds.width / 2, bounds.height / 2], :radius => 72)
  stroke_star([bounds.width / 2, bounds.height * 0.25], :radius => 72)
end
