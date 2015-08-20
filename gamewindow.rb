require 'gosu'

class Entity
	attr_accessor :x, :y, :z, :animations	

	def initialize(image_url, x, y, z)
		@image = Gosu::Image.new(image_url)
		@x = x
		@y = y
		@z = z
		@animations = {} 
	end	

	def update
		#TODO
	end

	def draw
		if @current_animation.nil?
			@image.draw(x, y, z)
		else
			
		end
	end

	def add_animation(animation_name, animation_speed, tile_width, tile_height, offset, tile_start, tile_end)
		animations[animation_name] = Animation.new
	end

	def set_current_animation(next_animation)
		@current_animation = animations[next_animation]
	end

end

class Animation
	def initialize
		#TODO
	end
end

class GameWindow < Gosu::Window
	def initialize
		super 250, 200, fullscreen: true
		@background_entity = Entity.new("media/arbre.png", 0, 0, 0)
		@wizard_entity = Entity.new("media/wizard.png", 0, 0, 0)
	end
	
	def update

	end

	def draw
		@background_entity.draw
		@wizard_entity.draw
	end

	def button_down(id)
		if id == Gosu::KbEscape
			close
		end
	end
end

window = GameWindow.new
window.show
