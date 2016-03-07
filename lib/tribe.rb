class Tribe

  attr_reader :name, :members
  attr_writer :members


  def initialize options = {}
    @name = options[:name]
    @members = options[:members]
    puts "Tribe #{@name}  with members #{@members.map{|e| e.to_s}} were created!"
  end

  def tribal_council options = {}

    all_members = @members.reject{|member| member.to_s == options[:immune].to_s}
    @members.delete(all_members.sample)
  end

  def to_s
    @name
  end

end
