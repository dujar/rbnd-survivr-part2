class Game
  attr_reader :tribes
  
  def initialize tribe1,tribe2
   @tribes = []
   @tribes << tribe1
   @tribes << tribe2
  end

  def tribes
    @tribes
  end

  def add_tribe tribe
    @tribes << tribe 
  end 

  def immunity_challenge
    @tribes.shuffle.first
    
  end

  def clear_tribes
    @tribes = []
  end

  def merge say
    new_tribe = Tribe.new(name: say, members: [])
    @tribes.each do |tribe| 
      new_tribe.members.concat(tribe.members)
    end
    puts "new_tribe" 
    puts new_tribe 
    new_tribe
  end

  def individual_immunity_challenge
     loser = immunity_challenge.members.shuffle.pop
  end

end
