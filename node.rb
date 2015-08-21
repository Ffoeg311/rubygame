class Node

  attr_accesor :children, :parent
  
  def intialize(parent)
    @parent = parent
    @children = []
  end

  def add_child

  end

  def update
    @children.each { |child| child.update }
  end

  def draw
    @children.each { |child| child.draw}
  end
end