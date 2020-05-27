require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'
require 'mocha/minitest'
require 'pry'

class MuseumTest < Minitest::Test

  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
    @patron_1 = Patron.new("Bob", 20)
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2 = Patron.new("Sally", 20)
    @patron_2.add_interest("IMAX")
    @patron_3 = Patron.new("Johnny", 5)
    @patron_3.add_interest("Dead Sea Scrolls")
  end

  def test_it_exists
    assert_instance_of Museum, @dmns
  end

  def test_it_returns_name
    assert_equal "Denver Museum of Nature and Science", @dmns.name
  end

  def test_it_can_add_exhibit
    @dmns.add_exhibit(@gems_and_minerals)
    assert_equal [@gems_and_minerals], @dmns.exhibits
    @dmns.add_exhibit(@dead_sea_scrolls)
    assert_equal [@gems_and_minerals, @dead_sea_scrolls], @dmns.exhibits
    @dmns.add_exhibit(@imax)
    assert_equal [@gems_and_minerals, @dead_sea_scrolls, @imax], @dmns.exhibits
  end

  def test_it_can_add_interests_for_patron
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    @patron_1 = Patron.new("Bob", 20)
    assert_instance_of Patron, @patron_1
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2 = Patron.new("Sally", 20)
    assert_instance_of Patron, @patron_2
    @patron_2.add_interest("IMAX")
    @dmns.recommend_exhibits(@patron_1)
    assert_equal [@dead_sea_scrolls, @gems_and_minerals], @dmns.recommend_exhibits(@patron_1)
    @dmns.recommend_exhibits(@patron_2)
    assert_equal [@imax], @dmns.recommend_exhibits(@patron_2)

  end

  def test_it_can_admit_patrons
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    assert_equal [], @dmns.patrons
    @patron_1 = Patron.new("Bob", 20)
    assert_instance_of Patron, @patron_1
    @patron_1.add_interest("Gems and Minerals")
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_2 = Patron.new("Sally", 20)
    assert_instance_of Patron, @patron_2
    @patron_2.add_interest("Dead Sea Scrolls")
    @patron_3 = Patron.new("Johnny", 5)
    assert_instance_of Patron, @patron_3
    @patron_3.add_interest("Dead Sea Scrolls")
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)
    assert_equal [@patron_1, @patron_2, @patron_3], @dmns.patrons
  end

  def test_it_can_show_patrons_by_exhibit_interest
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)
    @dmns.patrons_by_exhibit_interest
  end

end
