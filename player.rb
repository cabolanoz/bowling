class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def eql?(other)
    @name == other.name
  end

  def hash
    @name.hash
  end
end
