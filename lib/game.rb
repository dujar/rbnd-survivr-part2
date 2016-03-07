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

  def merge tribe_name
    new_members = []
    @tribes.each{|tribe| new_members += tribe.members}
    clear_tribes
    puts "Merged tribe!".pink
    add_tribe(Tribe.new(name: tribe_name, members: new_members))
    @tribes.first
  end

  def individual_immunity_challenge

    loser_members = immunity_challenge.members
    loser_members.each{|member| member.to_s}.shuffle.pop
  end

end
