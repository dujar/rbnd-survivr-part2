class Contestant
    attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    @name
  end

  def first
    self[0]
  end
  
end
