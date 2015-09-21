require 'minitest/autorun'
require 'minitest/pride'
require 'json'
require 'byebug'
require './current_conditions'
require './10dayforecast'
require './sunriseset'

class CurrentConditions
    private def get_response
      file = File.read("boston.json")
      hash = JSON.parse(file)
    end
end

class TenDayCast
    private def get_response
      file = File.read("10day.json")
      hash = JSON.parse(file)
    end
end

class WUndergroundTest < Minitest::Test

  def test_user_input_city
    assert_equal "Boston, MA",
      CurrentConditions.new("02101").full
  end
  def test_current_temp
    assert_equal 63.9,
      CurrentConditions.new("02101").temp
  end

  def test_current_weather
    assert_equal "Clear", CurrentConditions.new("02101").weather
  end

  def test_ten_day
    assert TenDayCast.new("02101").ten_day.include?("Plentiful sunshine. High 77F. W winds shifting to SE at 10 to 15 mph.")
  end

  def test_sunrise
    assert_equal "6:30", SunRiseSet.new("02101").sunrise
  end

  def test_sunset
    assert_equal "18:43", SunRiseSet.new("02101").sunset
  end

end
