require 'httparty'
require 'byebug'

class TenDayCast
  def initialize (zip)
    @zip = zip
    @response = get_response
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/forecast10day/q/#{@zip}.json")
  end

  def one_day_forecast(s)
    d = ""
    d << @response["forecast"]["txt_forecast"]["forecastday"][s]["title"]
    d << "\n"
    d << @response["forecast"]["txt_forecast"]["forecastday"][s]["fcttext"]
    d << "\n"
    d << "\n"

    d
  end

  def ten_day
    t = ""
    (0..18).step(2) do |s|
    t << one_day_forecast(s)
    t << "\n"
    end
    t
  end
end
