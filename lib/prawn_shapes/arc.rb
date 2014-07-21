module Prawn
  module Graphics
    # options must include :radius and :side
    # side is either :left or :right
    # see pie_slice for explanation of optional
    # :stroke_both_sides option
    #
    def half_circle(center, options)
      case options[:side]
      when :left
        start_angle = 90
        end_angle = 270
      when :right
        start_angle = 270
        end_angle = 90
      end
      pie_slice(center,
                :radius => options[:radius],
                :start_angle => start_angle,
                :end_angle => end_angle,
                :stroke_both_sides => options[:stroke_both_sides])
    end

    # options must include :radius and :quadrant
    # quadrant is 1, 2, 3, or 4
    # see pie_slice for explanation of optional
    # :stroke_both_sides option
    #
    def quarter_circle(center, options)
      case options[:quadrant]
      when 1
        start_angle = 0
        end_angle = 90
      when 2
        start_angle = 90
        end_angle = 180
      when 3
        start_angle = 180
        end_angle = 270
      when 4
        start_angle = 270
        end_angle = 360
      end
      pie_slice(center,
                :radius => options[:radius],
                :start_angle => start_angle,
                :end_angle => end_angle,
                :stroke_both_sides => options[:stroke_both_sides])
    end

    # options must include :radius, :start_angle, and :end_angle
    # startAngle and endAngle are in degrees
    # if an optional :stroke_both_sides option is true, then both
    # sides of the slice will be included for stroking. the default is
    # to just stroke one side since this will tend to be used to build
    # up an entire circle, and if both sides were stroked, then we
    # would get double-stroked lines where two pie slices shared a
    # (not usually noticeable, but would be if transparency were used)
    #
    # 0 degrees is directly right and 90 degrees is straight up
    # arc will be drawn counterclockwise from startAngle to endAngle
    #
    def pie_slice(center, options)
      vertices = arc_vertices(center, options)
      vertices.unshift(:point => center)
      if options[:stroke_both_sides]
        closed_curve(vertices)
      else
        open_curve(vertices)
      end
    end

    # options must include :radius, :start_angle, and :end_angle
    # startAngle and endAngle are in degrees
    #
    # 0 degrees is directly right and 90 degrees is straight up
    # arc will be drawn counterclockwise from startAngle to endAngle
    #
    def arc_around(center, options)
      open_curve(arc_vertices(center, options))
    end

    # vertices is an array of hashes containing :vertex and optional
    # :handle1 and :handle2 elements
    def open_curve(vertices)
      return if vertices.empty?
      vertices = vertices.dup
      origin = vertices.shift
      move_to(origin[:point])
      previous_handle2 = origin[:handle2]
      vertices.each do |vertex|
        curve_to(vertex[:point],
                 :bounds => [previous_handle2 || vertex[:point],
                             vertex[:handle1] || vertex[:point]])
        previous_handle2 = vertex[:handle2]
      end
    end

    # vertices is an array of hashes containing :vertex and optional
    # :handle1 and :handle2 elements
    def closed_curve(vertices)
      return if vertices.empty?
      vertices = vertices.dup
      origin = vertices.shift
      move_to(origin[:point])
      previous_handle2 = origin[:handle2]
      vertices.each do |vertex|
        curve_to(vertex[:point],
                 :bounds => [previous_handle2 || vertex[:point],
                             vertex[:handle1] || vertex[:point]])
        previous_handle2 = vertex[:handle2]
      end
      curve_to(origin[:point],
               :bounds => [previous_handle2 || origin[:point],
                           origin[:handle1] || origin[:point]])
    end

    ops    = %w{fill stroke fill_and_stroke}
    shapes = %w{half_circle quarter_circle pie_slice arc_around open_curve closed_curve}

    ops.product(shapes).each do |operation,shape|
      class_eval "def #{operation}_#{shape}(*args); #{shape}(*args); #{operation}; end"
    end

    private

    def arc_vertices(center, options)
      radius = options[:radius]
      start_degrees = options[:start_angle]
      end_degrees = options[:end_angle]
      return if start_degrees == end_degrees

      overall_start_angle = (start_degrees % 360.0).to_radians
      overall_end_angle = (end_degrees % 360.0).to_radians

      # if the angles are now equal, when they weren't before, then
      # they describe an entire circle
      return circle_at(center, :radius => radius) if overall_start_angle == overall_end_angle

      overall_end_angle = overall_end_angle + 2.0 * Math::PI if overall_end_angle < overall_start_angle

      delta = overall_end_angle - overall_start_angle
      quadrants = (delta / (Math::PI * 0.5)).ceil

      vertices = []
      quadrants.times do |i|
        start_angle = overall_start_angle + Math::PI * 0.5 * i

        if i == quadrants - 1 then end_angle = overall_end_angle
        else end_angle = start_angle + Math::PI * 0.5
        end

        delta = end_angle - start_angle
        handle_multiplier = KAPPA * delta / (Math::PI * 0.5) * radius

        # negate the angles so as to get the stated orientation of angles
        # start_angle = -start_angle
        # end_angle = -end_angle

        vertex = {}
        point = [Math.cos(start_angle), Math.sin(start_angle)]
        vertex[:point] = [center[0] + radius * point[0],
                          center[1] + radius * point[1]]
        handle = point.unit_perpendicular_vector(:counter_clockwise => false)
        vertex[:handle2] = [vertex[:point][0] + handle_multiplier * handle[0],
                            vertex[:point][1] + handle_multiplier * handle[1]]

         #fill_circle_at(center, :radius => 10)
         #fill_circle_at(vertex[:point], :radius => 10)
         #stroke_circle_at(vertex[:handle2], :radius => 10)
        # stroke_line(vertex[:point], vertex[:handle1])
        vertices << vertex

        vertex = {}
        point = [Math.cos(end_angle), Math.sin(end_angle)]
        vertex[:point] = [center[0] + radius * point[0],
                          center[1] + radius * point[1]]
        handle = point.unit_perpendicular_vector(:counter_clockwise => true)
        vertex[:handle1] = [vertex[:point][0] + handle_multiplier * handle[0],
                            vertex[:point][1] + handle_multiplier * handle[1]]
         #fill_circle_at(vertex[:point], :radius => 10)
         #fill_and_stroke_circle_at(vertex[:handle1], :radius => 10)
        # stroke_line(vertex[:point], vertex[:handle2])
        vertices << vertex
      end
      vertices
    end
  end
end

class Numeric
  def to_radians
    self * 2.0 * Math::PI / 360.0
  end
end

class Array
  def unit_vector
    denominator = Math.sqrt(self[0] * self[0] + self[1] * self[1])
    return self if denominator == 0.0
    [self[0] / denominator, self[1] / denominator]
  end

  # if :counter_clockwise => true option, then return a new vector
  # that points 90 degrees counterlockwise of aVector with a magnitude
  # of 1.0, otherwise return a new vector that points 90 degrees
  # clockwise of aVector with a magnitude of 1.0
  def unit_perpendicular_vector(options={})
    return [self[1], -self[0]].unit_vector if options[:counter_clockwise]
    [-self[1], self[0]].unit_vector
  end
end
