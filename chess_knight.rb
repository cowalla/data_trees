require_relative 'trees.rb'

class KnightPathFinder
  attr_reader :move_tree
  def initialize(start_position)
    @position = start_position
    @move_tree = build_move_tree
  end

  TOTAL_CHESS_LOCATIONS = 64

  def build_move_tree
    visited_positions = [@position]
    root_node = TreeNode.new(@position)
    stack = [root_node]
    until visited_positions.length == TOTAL_CHESS_LOCATIONS
      node = stack.shift
      new_positions = KnightPathFinder.new_move_positions(node.value)
      new_positions.each do |position|
        next if visited_positions.include?(position)
        visited_positions << position
        new_node = TreeNode.new(position)
        node.add_child(new_node)
        stack << new_node
      end
    end
    root_node
  end


  def self.new_move_positions(pos)
    x, y = pos
    [ [x-2,y-1],
    [x-2, y+1],
    [x+2, y-1],
    [x+2, y+1],
    [x-1, y+2],
    [x+1, y+2],
    [x+1, y-2],
    [x-1, y-2]
  ].select do |a, b|
      a >= 0 && a < 8 && b >= 0 && b < 8
    end
  end

  def find_path(end_position)
    @move_tree.bfs(end_position).path
  end

end


