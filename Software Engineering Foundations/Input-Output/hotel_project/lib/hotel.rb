require_relative "room"

class Hotel
  def initialize(name,room_hash)
    @name = name
    @rooms = Hash.new
    room_hash.keys.each do |key|
      @rooms[key] = Room.new(room_hash[key])
    end
    # alternative
    # @rooms = Hash.new { |hash,key| hash[key] = Room.new(room_hash[key])}
    # room_hash.keys.each { |key| @rooms[key] }
  end

  def name
    @name.split.map do |word|
      word.capitalize
    end.join(" ")

    # Alternate
    # @name.split.map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    @rooms.has_key?(room_name)
  end

  def check_in(person,room_name)
    if self.room_exists?(room_name)
      if @rooms[room_name].add_occupant(person)
        puts 'check in successful'
      else
        puts 'sorry, room is full'
      end
    else
      puts 'sorry, room does not exist'
    end
  end

  def has_vacancy?
    @rooms.each_value do |room|
      if !room.full?
        return true
      end
    end
    return false
  end

  def list_rooms
    @rooms.each do |room_name, room|
      print room_name + ". " + room.available_space.to_s + "\n"
    end
  end
end
