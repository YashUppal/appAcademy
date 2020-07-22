require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos                          
  end

  def losing_node?(evaluator)

    if self.board.tied?
      return false
    end

    if self.board.over?
      if self.board.winner != evaluator 
        return true
      elsif (self.board.winner == evaluator) || (self.board.winner == nil)
        return false
      end
    end

    if self.alternate_mark == evaluator
      # opponents
      self.children.any? { |node| node.losing_node?(evaluator) }  
    else
      # players
      self.children.all? { |node| node.losing_node?(evaluator) } 
    end

  end

  def winning_node?(evaluator)
    if self.board.over?
      if self.board.winner == evaluator
        return true
      else
        return false
      end
    end

    if self.next_mover_mark == evaluator
      self.children.any? { |node| node.winning_node?(evaluator) }
    else
      self.children.all? { |node| node.winning_node?(evaluator) }
    end

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children_nodes = Array.new
    i = 0
    while i < self.board.rows.length
      j = 0
      while j < self.board.rows.length
        if self.board.empty?([i,j])
          duped_board = self.board.dup
          duped_board.[]=([i,j],self.next_mover_mark) 
          duped_node = self.class.new(duped_board,self.alternate_mark,[i,j])
          children_nodes << duped_node
        end
        j += 1
      end
      i += 1
    end
    return children_nodes
  end

  def alternate_mark
    if self.next_mover_mark == :o
      return :x
    else
      return :o
    end
  end

  def alt_player_opp(evaluator)
    if evaluator == :o
      return :x
    else
      return :o
    end
  end

end
