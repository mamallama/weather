require 'httparty'
require 'byebug'


class CurrentConditions
  def initialize (zip)
    @zip = zip
    @response = get_response
  end

  def full
    @response["current_observation"]["display_location"]["full"]
  end

  def temp
    @response["current_observation"]["temp_f"].to_f
  end

  def weather
    @response["current_observation"]["weather"]
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/#{@zip}.json")
  end

end
