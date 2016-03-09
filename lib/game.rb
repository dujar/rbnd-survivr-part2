class Game
  attr_reader :tribes
  
  def initialize *tribes
   @tribes = tribes
  end

  def add_tribe tribe
    @tribes << tribe 
  end 

  def immunity_challenge
    @tribes.sample
  end

  def clear_tribes
    @tribes = []
  end

  def merge tribe_name
    new_members = []
    @tribes.each{ |tribe| new_members += tribe.members}
    puts "Merged tribe!".pink
    Tribe.new(name: tribe_name, members: new_members)
  end

  def individual_immunity_challenge
      @tribes.first.members.sample
  end

end
