require 'gosu'
require './entity'
require './node'

class GameWindow < Gosu::Window
	def initialize
		super 250, 200
		
		# Everything is connected to the root node
		@root_node = Node.new(0, 0, 0)
		
		
		background_entity = Entity.new("media/arbre.png", 0, 0, 0)
		background_node = Node.new(0, 0, 0)
		background_node.add_child(background_entity)
		@root_node.add_child(background_node)		
	
		wizard_entity = Entity.new("media/wizard.png", 0, 0, 0)
		wizard_entity.add_animation(:walk, 100, 32, 32, 20, 30)
		wizard_entity.set_current_animation(:walk)
		@player_node = Node.new(32, 0, 0)
		@player_node.add_child(wizard_entity)
		@root_node.add_child(@player_node)
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
