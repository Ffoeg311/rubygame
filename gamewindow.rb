require 'gosu'
require './entity'
require './node'
require './boilerplates/rpg_movement_controller'
require './boilerplates/rpg_player_node'
require './boilerplates/background_node'

class GameWindow < Gosu::Window
  def initialize
		super 250, 200 #, fullscreen: true
		
		# Everything is connected to the root node
		@root_node = Node.new(0, 0, 0)
		
		# Create the background entity
		background_node = BackgroundNode.new(0, 0, 0, "media/arbre.png")
		@root_node.add_child(background_node)
	
		# Create the player node
		player_node = RpgPlayerNode.new(32, 0, 0, "media/ranger1.png")
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