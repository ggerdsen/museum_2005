class Museum

  attr_reader :name,
              :exhibits,
              :recommend_exhibits,
              :admission,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    found = []
    found << patron.interests.map do |interest|
      @exhibits.find_all do |exhibit|
        interest == exhibit.name
      end
    end
    found.flatten
  end

  def admit(patron)
    @patrons << patron
  end

end
