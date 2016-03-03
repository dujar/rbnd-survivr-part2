class Jury
  attr_accessor :jury, :members, :finalists

  def initialize
    
    @@members = []
  end

  def add_member member
    @@members <<  member
  end

  def members
    @@members
  end

  def cast_votes finalists
    winner =[]
    loser = []
    votes = Hash.new
    win = finalists.sample
    winner << win
    loser << finalists-win
    votes = { winner: winner, loser: loser}
    votes.rehash
  end

end
