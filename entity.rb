require 'gosu'
require './animation'

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

  def draw(parent_x, parent_y, parent_z)
		entity_x, entity_y, entity_z = parent_x + x, parent_y + y, parent_z + z
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
