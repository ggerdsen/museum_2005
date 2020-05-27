class Museum

  attr_reader :name,
              :exhibits,
              :recommend_exhibits,
              :admission,
              :patrons,
              :patrons_by_exhibit_interest

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @patron_hash = {}
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

  def patrons_by_exhibit_interest
    @patron_hash = @exhibits.each do |exhibit|
      exhibit.name
      @patrons.find_all do |patron|
        patron.interests.each do |interest|
          exhibit.name == interest
          patron
        end
      end
    end
  end

  def ticket_lottery_contestants(exhibit)

  end

  def draw_lottery_winner(exhibit)

  end

  def announce_lottery_winner(exhibit)

  end

end
