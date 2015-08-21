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