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
		@controllers.push(controller)
	end
	
  def update
    @children.each { |child| child.update }
		@controllers.each { |controller|  controller.update(self) }
  end

  def draw(parent_x, parent_y, parent_z)
    @children.each { |child| child.draw(@x + parent_x, @y + parent_y, @z + parent_z)}
  end
end

class Controller
	def initialize
		
	end

	def update(parent)
		
	end
end

class RPGMovementController < Controller
	def initialize
		super
	end
	
	def update(parent)
		#puts parent.inspect
		if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft then
			parent.x -= 1
		end
    if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight then
			parent.x += 1
    end
		if Gosu::button_down? Gosu::KbUp or Gosu::button_down? Gosu::GpButton0 then
			parent.y -= 1
		end
		if Gosu::button_down? Gosu::KbDown or Gosu:: button_down? Gosu::GpButton1 then	
			parent.y += 1
		end	
	end
end
