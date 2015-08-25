class Controller
  attr_accessor :parent

  def initialize

  end

  def update
    
  end

  def entities    
    valid_children = []
    parent.children.each do |child|
      valid_children.push(child) if child.respond_to? :set_current_animation
    end
    valid_children    
  end

end