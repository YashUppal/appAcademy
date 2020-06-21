
  def scatter
    count = 1
    outer_iterator = 0
    while outer_iterator < board.length
      inner_iterator = 0
      while inner_iterator < board.length
        break if self.queen_count == @num_queens
        # threaten?([inner_iterator,outer_iterator],[outer_iterator + count, inner_iterator + count])

          # puts "#{[inner_iterator,outer_iterator]} #{[outer_iterator + count, inner_iterator + count]}"

          # if board[outer_iterator+count] != nil
          #   if inner_iterator+count < board.length
          #     # puts "#{[outer_iterator+count,inner_iterator+count]}"
          #     threaten?([inner_iterator,outer_iterator],[outer_iterator+count,inner_iterator+count])
          #   end
          # end

          if outer_iterator < board.length / 2
            # puts "#{[outer_iterator+count,inner_iterator+count]}"
            puts "#{[inner_iterator,outer_iterator]} #{[outer_iterator + count, inner_iterator + count]}"
            if threaten?([inner_iterator,outer_iterator],[outer_iterator+count,inner_iterator+count])
              # count += 1
            end
          end

        inner_iterator += 1
      end
      outer_iterator += 1
    end
  end