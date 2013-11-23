require './trees.rb'

class TicTacToeNode
  def initialize(board, turn, prev_move_pos = nil)
    @board = board
    @turn =  turn
    @prev_move_pos = prev_move_pos
  end

  def possible_moves
    possible_moves = []
    @board.each_with_index do |row, x|
      row.each_with_index do |element, y|
        possible_moves << [x,y] if element.nil?
      end
    end
    possible_moves
  end

  def children
    root_state = TreeNode.new(self)
    state = root_state
    stack = [state]
    until !state.value.board.flatten.include?(nil)
      state = stack.shift


    end


  end



  def losing_node?(player)
  end

  def winning_node?(player)
  end


end