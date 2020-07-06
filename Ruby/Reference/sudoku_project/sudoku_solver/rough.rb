          # if val >= 9
          #   self.board.update_at(0,[i,j])
          #   # j -= 1
            
          #   if j == 0
          #     i = i - 1
          #     j = 8
          #   else
          #     j -= 1
          #   end

          #   val = self.board.grid[i][j].value + 1 if self.board.grid[i][j].value != 9
          # end

          if self.legal_move?([i,j],val)
            res = self.board.update_at(val,[i,j])
            # break if res
            if res
              j += 1
              break
            end
          else
            val += 1 #if self.board.grid[i][j].value != 9

            if val > 9
            self.board.update_at(0,[i,j])
            # j -= 1
            
            if j == 0
              i = i - 1
              j = 8
            else
              j -= 1
            end

            val = self.board.grid[i][j].value + 1 if self.board.grid[i][j].value != 9
          end
          end


        # j+=1 if self.board.grid[i][j].given
        if self.board.grid[i][j].given && !backtracing
          backtracing = false
          j += 1
          next
        end
        
        while val <= 9
          system("clear")
          puts
          self.board.render
          puts
          sleep(0.2)
          puts
          
          if self.legal_move?([i,j],val)
            placed = self.board.update_at(val,[i,j])
            print "#{[i,j]}"
            # j += 1
            break
          else
            val += 1
          end
        end

        if placed
          placed = false
          puts "Enterted placed"
          # sleep(3)
          j += 1
          val = 1
        else
          backtracing = true
          if j == 0
            self.board.grid[i][j].value = 0 if !self.board.grid[i][j].given
            if i != 0
              i -= 1 
              j = 8
            end
            val = self.board.grid[i][j].previously_guessed.last + 1
          else
            self.board.grid[i][j].value = 0 if !self.board.grid[i][j].given
            j -= 1
            val = self.board.grid[i][j].previously_guessed.last + 1
          end
        end



 backtracking = false
    val = 1
    i = 0
    while i < self.board.grid.length
      j = 0 
      while j < self.board.grid.length
        # placed = false
        system("clear")
        self.board.render
        print "\n#{[i,j]}\n"
        # sleep()
        
        if !self.board.grid[i][j].given
          placed = false
          backtracking = false
          while val < 10
            if self.legal_move?([i,j],val)
              self.board.update_at(val,[i,j])
              val = 1
              placed = true
              j += 1
            else
              val += 1
            end
            break if placed
          end
        else
        # move to next if value given
          if backtracking
            if j == 0
              i = i - 1
              j = 8
            else
              j -= 1
            end
            val = self.board.grid[i][j].value + 1
          else
            j += 1
          end
        next

        end

        if !placed
          backtracking = true
          placed = false
          val = self.board.grid[i][j].value + 1
          self.board.grid[i][j].value = 0

          if j == 0
            i = i - 1
            j = 8
          else
            j -= 1
          end

        end
        # j += 1
      end

      i += 1 
    end