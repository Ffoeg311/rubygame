require 'gosu'
require './entity'
require './node'

class GameWindow < Gosu::Window
	def initialize
		super 250, 200, fullscreen: true
		
		# Everything is connected to the root node
		@root_node = Node.new(0, 0, 0)
		
		# Create the background entity
		background_entity = Entity.new("media/arbre.png", 0, 0, 0)
		background_node = Node.new(0, 0, 0)
		background_node.add_child(background_entity)
		@root_node.add_child(background_node)		
	
		# Create the main player
		wizard_entity = Entity.new("media/ranger1.png", 0, 0, 0)
		wizard_entity.add_animation(:walk_up, 200, 18, 28, 0, 2)
		wizard_entity.add_animation(:walk_right, 200, 18, 28, 3, 5)
		wizard_entity.add_animation(:walk_down, 200, 18, 28, 6, 8)
		wizard_entity.add_animation(:walk_left, 200, 18, 28, 9, 11)
		wizard_entity.add_animation(:stand, 200, 18, 28, 7, 7)
		wizard_entity.set_current_animation(:stand)
		player_node = Node.new(32, 0, 0)
		player_node.add_child(wizard_entity)

		# Control the main player
		playercontroller = RPGMovementController.new	
		player_node.add_controller(playercontroller)
		
		@root_node.add_child(player_node)
	end
	
	def update
		@root_node.update
	end

	def draw
		@root_node.draw(@root_node.x, @root_node.y, @root_node.z)
	end

	def button_down(id)
		if id == Gosu::KbEscape
			close
		end
	end
	
end

window = GameWindow.new
window.show
