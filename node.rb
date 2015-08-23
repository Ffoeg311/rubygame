class Node

  attr_accessor :children, :controllers, :x, :y, :z
  
  def initialize(x, y, z)
    @x, @y, @z = x, y, z
    @children = []
		@controllers = []
  end

  def add_child(child)
		@children.push(child)
  end

	def add_controller(controller)
    controller.parent = self
		@controllers.push(controller)
	end
	
  def update
    @children.each { |child| child.update}
		@controllers.each { |controller|  controller.update }
  end

  def draw(parent_x, parent_y, parent_z)
    @children.each { |child| child.draw(@x + parent_x, @y + parent_y, @z + parent_z)}
  end

  def move(x_speed, y_speed) 
    #TODO, adjust for framerate.    
    @x += x_speed
    @y += y_speed
  end
end