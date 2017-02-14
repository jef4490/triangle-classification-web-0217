require "pry"
class Triangle

  attr_accessor :side_one, :side_two, :side_three, :sides
  def initialize(side_one, side_two, side_three)
    @side_one = side_one
    @side_two = side_two
    @side_three = side_three
    @sides = [@side_one, @side_two, @side_three]
  end

  def kind
    raise TriangleError if !valid?
    return :equilateral if side_one == side_two && side_one == side_three && side_one
    return :isosceles if side_two == side_three || side_one == side_three || side_one == side_two
    return :scalene if valid?
  end

  def valid?
    !sides.any?{|side| side == 0} && triangle_inequality?
  end

  def triangle_inequality?
    side_one + side_two > side_three && side_two + side_three > side_one && side_one + side_three > side_two
  end


end

class TriangleError < StandardError

end
