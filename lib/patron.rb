class Patron

  attr_reader :name,
              :money,
              :interests

  def initialize(name, money)
    @name = name
    @money = money
    @interests = []
  end

  def add_interest(interest)
    @interests << interest
  end


end
