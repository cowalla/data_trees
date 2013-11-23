class TreeNode

  attr_accessor :value, :parent, :children

  def initialize(value)
    @parent = nil
    @value = value
    @children = []
  end


  def detach
    @parent.children.delete_if { |child| self == child }
    @parent = nil
  end

  def add_child(new_child)
    new_child.detach unless new_child.parent.nil?
    @children << new_child
    new_child.parent = self
  end


  def dfs(target=nil, &proc)
    proc ||= Proc.new do |node|
      node.value == target
    end

    if proc.call(self)
      return self
    elsif self.children.empty?
      return nil
    else
      result = nil
      self.children.each do |child|
        result = child.dfs(target, &proc)
        break unless result.nil?
      end
      result
    end
  end

  def bfs(target=nil, &proc)

    proc ||= Proc.new do |node|
      node.value == target
    end
    stack = [self]
    until stack.empty?
      current_element = stack.shift
      if proc.call(current_element)
        return current_element
      else
        current_element.children.each do |child|
          stack << child
        end
      end
    end
    nil
  end

  def path
    path = [self.value]
    current_node = self
    until current_node.parent.nil?
      parent = current_node.parent
      path.unshift(parent.value)
      current_node = parent
    end
    path
  end

  def to_s
    self.value
  end

end




