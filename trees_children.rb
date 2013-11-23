class TreeNode

  attr_accessor :value, :parent, :children

  def initialize(value)
    @parent = nil
    @value = value
    @children = []
  end


  def detach
    # position = self.parent.children.index(self)
    # self.parent.children.delete_at(position)
    @parent.children.delete_if { |child| self == child }
    @parent = nil
  end

  def add_child(new_child)
    new_child.detach unless new_child.parent.nil?
    @children << new_child
    new_child.parent = self
  end


  def dfs(target)
    # p self
    if self.value == target
      return self
    elsif self.children.empty?
      return nil
    else
      result = nil
      self.children.each do |child|
        result = child.dfs(target)
        break unless result.nil?
      end
      result
    end
  end

  def bfs(target)
    stack = [self]
    until stack.empty?
      current_element = stack.shift
      #p current_element
      if current_element.value == target
        return current_element
      else
        current_element.children.each do |child|
          stack << child
        end
      end
    end
    nil
  end

  def to_s
    self.value
  end

end

a = TreeNode.new("A")
b = TreeNode.new("B")
c = TreeNode.new("C")
d = TreeNode.new("D")
e = TreeNode.new("E")
f = TreeNode.new("F")
g = TreeNode.new("G")

a.add_child(b)
a.add_child(c)
a.add_child(d)
b.add_child(e)
b.add_child(f)
c.add_child(g)




