module Prawn
  module Graphics
    def star(point, options)
      x, y = point
      polygon(*star_points(point, options))
    end

    def half_star(point, options)
      points = star_points(point, options)
      case options[:side]
      when :left
        points.slice!(1..4)
      when :right
        points.slice!(6..9)
      end
      polygon(*points)
    end

    private

    # radius is the horizontal half-width of the star (the star is the hand-drawn type that looks more natural to the eye, so it does not fit perfectly into a circle)
    def star_points(point, options)
      x, y = point
      radius = options[:radius]
      y = y + radius * 0.05
      points = []
      points << [x,                 y + radius * 0.9]
      points << [x + 0.25 * radius, y + 0.2 * radius]
      points << [x + radius,        y + 0.2 * radius]
      points << [x + 0.4 * radius,  y - 0.2 * radius]
      points << [x + 0.7 * radius,  y - 1.0 * radius]
      points << [x,                 y - 0.5 * radius]
      points << [x - 0.7 * radius,  y - 1.0 * radius]
      points << [x - 0.4 * radius,  y - 0.2 * radius]
      points << [x - radius,        y + 0.2 * radius]
      points << [x - 0.25 * radius, y + 0.2 * radius]
      points
    end
  end
end
