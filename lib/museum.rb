class Museum

  attr_reader :name

  def initialize(name)
    @name = name
    @exhibits = []
  end

end
