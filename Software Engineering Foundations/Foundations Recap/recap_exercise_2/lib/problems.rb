# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
		# should have gone upto 2..(num_1 * num_2)
    (2..100).each do |multiple|
        return multiple if (multiple % num_1).zero? && (multiple % num_2).zero?
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
   bigrams = []
   iterator = 0
   count_hash = Hash.new(0)

   while iterator < str.length-1
    bigrams << str[iterator..iterator+1]
    iterator += 1
   end

   bigrams.each do |ele|
    count_hash[ele] += 1
   end
   
   (count_hash.sort_by {|key, value| value }).last.first
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
		def inverse
			inversed_hash = {}
			self.each do |key, value|
				inversed_hash[value] = key
			end
			inversed_hash
		end
		
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
		def pair_sum_count(num)
			pair_count = 0

			i = 0
			while i < self.length
				j = i
				while j < self.length
					pair_count += 1 if self[i] + self[j] == num
					j += 1	
				end
				i += 1
			end
			return pair_count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
		def bubble_sort(&prc)
			prc ||= Proc.new { |num1, num2| num1 > num2 }

			sorted = false
			while !sorted
				sorted = true
				iterator = 0
				while iterator < self.length-1
					if prc.call(self[iterator], self[iterator+1]) == 1
						self[iterator+1], self[iterator] = self[iterator], self[iterator+1]
						sorted = false
					elsif prc.call(self[iterator], self[iterator+1]) == true
						self[iterator], self[iterator+1] = self[iterator+1], self[iterator]
						sorted = false
					end
					iterator += 1
				end
			end
			return self
		end
end
