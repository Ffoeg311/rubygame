require 'gosu'

class Entity
	attr_accessor :x, :y, :z, :animations	

	def initialize(image_url, x, y, z)
		@image_url = image_url
		@image = Gosu::Image.new(image_url)
		@x, @y, @z = x, y, z
		@animations = {} 
	end	

	def update
		#TODO
	end

	def draw
		if @current_animation.nil?
			@image.draw(x, y, z)
		else
			@current_animation.draw(x, y, z)	
		end
	end

	def add_animation(animation_name, speed, tile_width, tile_height, first, last)
		animations[animation_name] = Animation.new(@image_url, speed, tile_width, tile_height, first, last)
	end

	def set_current_animation(next_animation)
		@current_animation = animations[next_animation]
	end

end

class Animation
	def initialize(image_url, speed, tile_width, tile_height, first, last)
		@speed = speed
		@tiles = Gosu::Image::load_tiles(image_url, tile_width, tile_height).slice(first..last)
	end

	def draw(x, y, z)
		img = @tiles[Gosu::milliseconds / @speed % @tiles.size]
		img.draw(x, y, z)
	end
end

class GameWindow < Gosu::Window
	def initialize
		super 250, 200, fullscreen: true
		@background_entity = Entity.new("media/arbre.png", 0, 0, 0)
		# Create the wizard and make them walk
		@wizard_entity = Entity.new("media/wizard.png", 0, 0, 0)
		@wizard_entity.add_animation(:walk, 100, 32, 32, 20, 30)
		@wizard_entity.set_current_animation(:walk)
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
