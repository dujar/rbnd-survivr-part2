require_relative "../lib/contestant"
require_relative "../lib/jury"
require_relative "../lib/tribe"


    @jury_members = %w(carlos walter aparna trinh diego juliana poornima)
    @jury_members.map!{ |member| Contestant.new(member) }
    @finalists = %w(orit colt)
    @finalists.map!{ |member| Contestant.new(member) }
    @jury = Jury.new
     @jury.members = @jury_members
     final_votes = @jury.cast_votes(@finalists)
       puts @jury.report_votes(final_votes)
         puts @jury.report_votes(final_votes).length

puts @jury.announce_winner final_votes


     contestants = ["person_one", "person_two"]
     contestants.map!{ |contestant| Contestant.new(contestant) }
      tribe = Tribe.new({name: "tribe", members: contestants})
puts tribe.to_s

