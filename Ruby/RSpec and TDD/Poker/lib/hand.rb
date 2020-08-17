class Hand
  RANKING = [:ace, :king, :queen, :jack, 10, 9, 8, 7, 6, 5, 4, 3, 2]
  HAND_HIERARCHY = [:royal_flush,:straight_flush,:four_of_a_kind,:full_house,:flush,:straight,:three_of_a_kind,:two_pair,:pair,:high_card]

  attr_reader :hand, :rank

  def initialize(hand)
    @hand = hand
    @rank = nil
    self.rank?
  end

  def rank?
    # royal flush
    # A, K, Q, J, 10, all the same suit.

    # suit array
    suit = @hand.map(&:suit)
    # rank array
    rank = @hand.map(&:rank)

    if suit.all? { |s| s == suit.first }
      if rank.all? { |r| [10,:ace,:king,:queen,:jack].include?(r) }
        @rank = :royal_flush
      end
    end

    if @rank
      return @rank
    end


    # straight flush
    #   Five cards in a sequence, all in the same suit.

    # suit array
    suit = @hand.map(&:suit)
    # rank array
    ranks = @hand.map(&:rank)

    if suit.all? { |s| s == suit.first }      
      # if (RANKING - ranks).length == 8
      #   @rank = :straight_flush
      # end
      if (RANKING & ranks) == ranks
        @rank = :straight_flush
      end
    end

    if @rank
      return @rank
    end

    # four of a kind
    # All four cards of the same rank.

    # suit array
    suit = @hand.map(&:suit)
    # rank array
    ranks = @hand.map(&:rank)

    rank_hash = Hash.new(0)

    ranks.each do |r|
      rank_hash[r] += 1
    end

    rank_hash.each do |k,v|
      if v == 4
        @rank = :four_of_a_kind
      end
    end

    if @rank
      return @rank
    end

    # 4. Full house
    # Three of a kind with a pair.

    # suit array
    suit = @hand.map(&:suit)
    # rank array
    ranks = @hand.map(&:rank)

    rank_hash = Hash.new(0)

    ranks.each do |r|
      rank_hash[r] += 1
    end

    if (rank_hash.has_value?(2) && rank_hash.has_value?(3))
      @rank = :full_house
    end

    if @rank
      return @rank
    end

    # flush
    # any five cards of the same suit, but not in sequence

    # suit array
    suit = @hand.map(&:suit)
    # rank array
    ranks = @hand.map(&:rank)

    if suit.all? { |s| s == suit.first }
      @rank = :flush
    end

    if @rank
      return @rank
    end

    # straight
    # Five cards in a sequence, but not of the same suit.

    # suit array
    suit = @hand.map(&:suit)
    # rank array
    ranks = @hand.map(&:rank)

    if (RANKING & ranks) == ranks
      @rank = :straight
    end

    if @rank
      return @rank
    end

    # three of a kind
    # Three cards of the same rank.

    # suit array
    suit = @hand.map(&:suit)
    # rank array
    ranks = @hand.map(&:rank)

    rank_hash = Hash.new(0)

    ranks.each do |r|
      rank_hash[r] += 1
    end
    
    
    if rank_hash.has_value?(3)
      @rank = :three_of_a_kind
    end
    
    if @rank
      return @rank
    end
    
    # two pair
    # Two different pairs.
    
    # suit array
    suit = @hand.map(&:suit)
    # rank array
    ranks = @hand.map(&:rank)

    rank_hash = Hash.new(0)

    ranks.each do |r|
      rank_hash[r] += 1
    end

    pair_count = 0

    rank_hash.each_value do |val|
      pair_count += 1 if val == 2
    end

    if pair_count == 2
      @rank = :two_pair
    end

    if @rank
      return @rank
    end

    # pair
    # Two cards of the same rank.

    # suit array
    suit = @hand.map(&:suit)
    # rank array
    ranks = @hand.map(&:rank)

    rank_hash = Hash.new(0)

    ranks.each do |r|
      rank_hash[r] += 1
    end

    pair_count = 0

    rank_hash.each_value do |val|
      pair_count += 1 if val == 2
    end

    if pair_count == 1
      @rank = :pair
    end

    if @rank
      return @rank
    end

    # high card
    # When you haven't made any of the hands above, the highest card plays.

    # suit array
    suit = @hand.map(&:suit)
    # rank array
    ranks = @hand.map(&:rank)

    max = RANKING.index(ranks.first)

    ranks.each_with_index do |r,i|
      if RANKING.index(r) < max
        max = RANKING.index(r)
      end
    end
    
    @rank = RANKING[max]

    if @rank
      return @rank
    end
  end

  def beats
    rank_idx = HAND_HIERARCHY.index(@rank)
    beats = HAND_HIERARCHY[rank_idx..-1]
    return beats
  end

end