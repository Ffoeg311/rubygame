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
end

class Controller
  attr_accessor :parent

	def initialize

	end

	def update
		
	end

	def entities
    #puts parent.children
    valid_children = []
    parent.children.each do |child|
      valid_children.push(child) if child.respond_to? :set_current_animation
    end
    puts valid_children
    valid_children
	end

end

class RPGMovementController < Controller
  
  attr_accessor :walking_entity, :direction

	def initialize
    super    
    @walking_left, @walking_right, @walking_up, @walking_down = false
  end

  # TODO add find_walking_entity to a callback that executes after the controller is added
  # to the player node

	def update
		if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft
			parent.x -= 1      
      set_direction(:left)
		end
    if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight
			parent.x += 1
      set_direction(:right)
    end
		if Gosu::button_down? Gosu::KbUp or Gosu::button_down? Gosu::GpButton0 
			parent.y -= 1
      set_direction(:up)
		end
		if Gosu::button_down? Gosu::KbDown or Gosu:: button_down? Gosu::GpButton1
			parent.y += 1
      set_direction(:down)
		end	
		update_animation
	end

  def set_direction(direction)
    puts "updating direction"
    @walking_left, @walking_right, @walking_up, @walking_down = false
    @walking_left = true if direction == :left
    @walking_right = true if direction == :right
    @walking_up = true if direction == :up
    @walking_down = true if direction == :down
  end

	def update_animation	
    if not @walking_entity
      @walking_entity = find_walking_entity      
      puts @walking_entity
    else
      walking_entity.set_current_animation(:walk_right) if @walking_right
      walking_entity.set_current_animation(:walk_left) if @walking_left
      walking_entity.set_current_animation(:walk_down) if @walking_down
      walking_entity.set_current_animation(:walk_up) if @walking_up
    end  	
		#puts entities.length
	end

  # Finds the entity that has the animations for walking
  def find_walking_entity
    entities.each do |entity|
      return entity if entity.has_anims?(:walk_right, :walk_left, :walk_up, :walk_down)
    end
    return nil
  end
end
