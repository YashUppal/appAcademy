class Map
  def initialize
    @map = Array.new
  end

  def set(key,value)
    index = nil
    @map.each_with_index do |pairs,idx|
      if pairs.first == key
        index = idx
      end
    end

    if index.nil?
      @map << [key,value]
    else
      @map[index] = [key,value]
    end
  end

  def get(key)
    @map.each do |pairs|
      if pairs.first == key
        return pairs.last
      end
    end
    nil
  end

  def show
    @map.each do |pairs|
      puts "#{pairs.first} => #{pairs.last}"
    end
    nil
  end

  def delete(key)
    deleted = nil
    @map.each_with_index do |pairs,idx|
      if pairs.first == key
        deleted = @map.delete_at(idx)
      end
    end
    deleted
  end
end