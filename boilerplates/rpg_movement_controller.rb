require '~/workspace/game/controller'

class RPGMovementController < Controller
  
  attr_accessor :walking_entity, :direction

  def initialize
    super        
    direction = :stand
  end

  # TODO add find_walking_entity to a callback that executes after the controller is added
  # to the player node

  def update
    # Determine the direction the player is moving
    if Gosu::button_down? Gosu::KbLeft  
      @direction = :walk_left   
    elsif Gosu::button_down? Gosu::KbRight
      @direction = :walk_right    
    elsif Gosu::button_down? Gosu::KbUp 
      @direction = :walk_up   
    elsif Gosu::button_down? Gosu::KbDown
      @direction = :walk_down
    else 
      case @direction
      when :walk_left then @direction = :stand_left        
      when :walk_right then @direction = :stand_right        
      when :walk_up then @direction = :stand_up        
      when :walk_down then @direction = :stand_down
      end       
    end   
    update_animation
    update_position
  end 

  def update_position
    move_x, move_y = 0, 0
    move_x = -1 if direction == :walk_left
    move_x =  1 if direction == :walk_right
    move_y = -1 if direction == :walk_up
    move_y =  1 if direction == :walk_down
    parent.move(move_x, move_y)
  end

  def update_animation  
    @walking_entity = find_walking_entity if not @walking_entity
    @walking_entity.set_current_animation(direction)      
  end

  # Finds the entity that has the animations for walking
  def find_walking_entity
    entities.each do |entity|
      return entity if entity.has_anims?(:walk_right, :walk_left, :walk_up, :walk_down)
    end
    return nil
  end
end