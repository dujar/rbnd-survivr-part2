class Jury
  attr_reader :finalists, :votes
  attr_accessor :members

  def initialize options = {}
    @votes = Hash.new
    @members = []
  end

  def add_member member
    @members <<  member
  end

  def members
    @members
  end

  def cast_votes finalists
    finalists.each do |finalist|
     @votes[finalist.to_s] = 0
    end
    @members.each do |member|
      key = finalists.sample.to_s
      @votes[key] += 1
      puts "member #{member} voted for #{key}"
    end
   # puts "the winner is #{@votes}"
    return @votes
  end

  def report_votes final_votes
    final_votes.each {|k,v| puts "#{k} has had #{v} votes"}
  end
  
  def announce_winner final_votes
winner =	final_votes.select {|k,v| v == final_votes.values.max }.keys.first
		return winner
  end

end
