class Node

  attr_accessor :children, :x, :y, :z
  
  def initialize(x, y, z)
    @x, @y, @z = x, y, z
    @children = []
  end

  def add_child(child)
		@children.push(child)
  end
	
	def set_parent(parent)
		@parent = parent
	end

  def update
    @children.each { |child| child.update }
  end

  def draw(parent_x, parent_y, parent_z)
    @children.each { |child| child.draw(@x, @y, @z)}
  end
end

class Controller
	def initialize

	end

	def update

	end
end
