class Array
  def my_uniq
    duplicated = []
    self.each do |ele|
      duplicated << ele if !duplicated.include?(ele)
    end
    return duplicated
  end
end