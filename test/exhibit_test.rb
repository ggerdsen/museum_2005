require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'
require 'pry'

class ExhibitTest < Minitest::Test

  def setup
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  end

  def test_it_exists
    assert_instance_of Exhibit, @exhibit
  end

  def test_it_returns_name
    assert_equal "Gems and Minerals", @exhibit.name
  end

  def test_it_returns_cost
    assert_equal 0, @exhibit.cost
  end


end
