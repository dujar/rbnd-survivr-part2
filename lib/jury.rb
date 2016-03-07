class Jury
  attr_reader :finalists
  attr_accessor :members

  def initialize options = {}
    
    @members = []
  end

  def add_member member
    @members <<  member
  end

  def members
    @members
  end

  def cast_votes finalists
    votes = Hash.new
    finalists.each do |finalist|
     votes[finalist] = 0
    end
    @members.each do |member|
      key = finalists.sample
      votes[key] += 1
      puts "member #{member} voted for #{key}"
    end
   # puts "the winner is #{votes}"
    return votes
  end

  def report_votes final_votes
    final_votes.each{|k,v| puts "#{k} has had #{v} votes".red}
  end
  
  def announce_winner final_votes
    winner =	final_votes.select {|k,v| v == final_votes.values.max }.keys.first
    puts "The winner is:"
    puts artii_art(winner).green
    puts "with #{final_votes.values.max} votes in his favor"
		return winner
  end

end
