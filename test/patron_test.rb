require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'
require 'pry'

class PatronTest < Minitest::Test

  def setup
    @patron_1 = Patron.new("Bob", 20)
  end

  def test_it_exists
    assert_instance_of Patron, @patron_1
  end

  def test_it_returns_name
    assert_equal "Bob", @patron_1.name
  end

  def test_it_returns_spending_money
    assert_equal 20, @patron_1.money
  end

end
