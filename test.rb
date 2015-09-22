require 'minitest/autorun'
require 'minitest/pride'
require 'json'
require 'byebug'
require './current_conditions'
require './10dayforecast'
require './sunriseset'
require './hurricane'

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

class SunRiseSet
    private def get_response
      file = File.read("astronomy.json")
      hash = JSON.parse(file)
    end
end

class Alertas
    private def get_response
      file = File.read("alerts.json")
      hash = JSON.parse(file)
    end
end

class CurrentHurricane
    private def get_response
      file = File.read("current_hurricane.json")
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

  def alerts
    assert " ", Alertas.new("02101").alerts
  end

  def test_current_hurricane
  assert "Tropical Storm Ida",  CurrentHurricane.new("02101").storm
  end

  def test_current_hurricane_lat
  assert 21.2,  CurrentHurricane.new("02101").storm
  end

  def test_current_hurricane_lon
  assert -48.8,  CurrentHurricane.new("02101").storm
  end

  def test_current_hurricane_wind
  assert 50,  CurrentHurricane.new("02101").storm
  end
end
