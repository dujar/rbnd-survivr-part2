require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"
require_relative "colorizr"
require 'artii'
require 'text-table'
require 'pp'

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
 @contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
 @contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
#
# # Create two new tribes with names
 @coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
 @hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# # Create a new game of Survivor
 @borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
    introduction
    title "Phase One"
    losers = 0
    immune_members = []
    8.times do
      losing_tribe = @borneo.tribes.shuffle.first
      puts "The losing tribe is #{losing_tribe}".red
      loser = losing_tribe.tribal_council()#no immune members
      puts " The loser member is #{loser}"
      losers += 1
      counting = 0
      @borneo.tribes.each{|tribe| counting += tribe.members.length}
      puts " #{losers} gone!"
      puts " #{counting} remaining players"
    end
end

def phase_two
    title "Phase Two"
    @borneo.clear_tribes
    @borneo.add_tribe(@merge_tribe)
  3.times do
    immune = @borneo.individual_immunity_challenge
    puts "The immune member is #{immune}".green
    losers = @merge_tribe.tribal_council(immune: immune)
    puts " The loser member is #{losers}"
  end
end

def phase_three
    title "Phase Three"
    7.times do
      immune = @borneo.individual_immunity_challenge
      puts "The immune members are #{immune}".green
      new_jury_member = @merge_tribe.tribal_council(immune: immune)
      #puts "The new jury member is #{new_jury_member}".green
      puts "The new jury member is #{new_jury_member}".yellow
      @jury.add_member(new_jury_member)
  end 
end

# To colorize the output and make it look better!
  def artii_art what
    a = Artii::Base.new :font => 'slant'
    a.asciify(what)
  end

  def introduction
    puts " Two Competing Tribes:"
    @borneo.tribes.each do |tribe|
      blue(tribe.name.to_s)
      tribe.members.each{|member| puts green(member)}
    end
  end

  def title what
    puts "*"*60
    puts artii_art(what).light_blue
    puts "*"*60
  end
  
  String.create_colors
# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
 phase_one #8 eliminations
 @merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
 phase_two #3 more eliminations
 @jury = Jury.new
 phase_three #7 elminiations become jury members
 finalists = @merge_tribe.members #set finalists
 vote_results = @jury.cast_votes(finalists) #Jury members report votes
 puts vote_results
 @jury.report_votes(vote_results) #Jury announces their votes
 @jury.announce_winner(vote_results) #Jury announces final winner
