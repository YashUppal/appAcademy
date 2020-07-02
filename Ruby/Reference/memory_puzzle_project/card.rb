class Card
  attr_reader :value, :face_up
  attr_writer :face_up

  def initialize(value,face_up)
    @value = value
    @face_up = face_up
  end

  def info
    # check if used anywhere
    # return the value of card if card is facing up
    if face_up
      return self.value
    else
      return nil
    end
  end

  def hide
    # hide a card / make it face down
    self.face_up = false
  end

  def reveal
    # reveal a card / make it face up
    self.face_up = true
  end
end