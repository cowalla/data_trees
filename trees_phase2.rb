class TreeNode
  def initialize(value)
    @left = nil
    @right = nil
    @parent = nil
    @position = nil
    @value = value
  end

  def position
    @position
  end

  def position=(pos)
    @position = pos
  end

  def value
    @value
  end

  def value=(value)
    @value = value
  end

  def parent
    @parent
  end

  def parent=(node)
    @parent = node
  end

  def left=(node)
    if node.nil?
      @left = nil
    else
      self.set_child(node, :left)
    end
  end

  def right=(node)
    if node.nil?
      @right = nil
    else
      self.set_child(node, :right)
    end
  end

  def left
    @left
  end

  def right
    @right
  end

  def detach
    case self.position
    when :left
      @parent.left = nil
    when :right
      @parent.right = nil
    end
    @position = nil
    @parent = nil
  end

  def set_child(new_child, position)
    case position
    when :left
      @left.detach unless @left.nil?
      @left = new_child
      new_child.parent = self
      new_child.position = :left
    when :right
      @right.detach unless @right.nil?
      @right = new_child
      new_child.parent = self
      new_child.position = :right
    end
  end



  def dfs(target)
    if self.value == target
      self
    else
      # p self (for checking output order)
      (self.left && self.left.dfs(target)) || (self.right && self.right.dfs(target))
    end
  end

  def bfs(target)
    stack = [self]
    until stack.empty?
      current_element = stack.shift
      # p current_element (for checking output order)
      if current_element.value == target
        return current_element
      else
        stack << current_element.left unless current_element.left.nil?
        stack << current_element.right unless current_element.right.nil?
      end
    end
    nil
  end

  def to_s
    self.value
  end

end