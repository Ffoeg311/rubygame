class Node

  attr_accessor :children
  
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

  def draw
    @children.each { |child| child.draw }
  end
end
