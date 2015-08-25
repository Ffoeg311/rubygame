require '~/workspace/game/node'
require '~/workspace/game/controller'

class BackgroundNode < Node
  def initialize(x, y, z, entity_url)
    super(x, y, z)
    background_entity = Entity.new(entity_url, 0, 0, 0)
    add_child(background_entity)
  end
end
