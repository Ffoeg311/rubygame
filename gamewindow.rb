require 'gosu'
require './entity'

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
