require '~/workspace/game/node'
require '~/workspace/game/controller'

class RpgPlayerNode < Node  
  
  def initialize(x, y, z, entity_url)
    super(x, y, z)
    
    player_entity = Entity.new(entity_url, 0, 0, 0)
    anim_speed = 4
    player_entity.add_animation(:walk_up,     anim_speed, 18, 28,  0, 2)
    player_entity.add_animation(:walk_right,  anim_speed, 18, 28,  3, 5)
    player_entity.add_animation(:walk_down,   anim_speed, 18, 28,  6, 8)
    player_entity.add_animation(:walk_left,   anim_speed, 18, 28,  9, 11)
    player_entity.add_animation(:stand_up,    anim_speed, 18, 28,  1, 1)
    player_entity.add_animation(:stand_right, anim_speed, 18, 28,  4, 4)
    player_entity.add_animation(:stand_down,  anim_speed, 18, 28,  7, 7)
    player_entity.add_animation(:stand_left,  anim_speed, 18, 28, 10, 10)
    add_child(player_entity)

    playercontroller = RPGMovementController.new
    add_controller(playercontroller)
  end

end