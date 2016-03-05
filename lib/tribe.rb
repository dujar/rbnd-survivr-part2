class Tribe

  attr_reader :name, :members


  def initialize options = {}
    @name = options[:name]
    @members = options[:members]
    puts "Tribe #{@name}  with members #{@members.map{|e| e.to_s}} were created!"
  end

  def tribal_council options = {}
   @members.reject{|member| member.to_s == options[:immune].to_s}.shuffle.sample
  end

  def to_s
    @name
  end

end
