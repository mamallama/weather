require 'httparty'
require 'byebug'


class CurrentHurricane
  def initialize (zip)
    @zip = zip
    @response = get_response
  end

  def storm

    x = ""
      x << @response["currenthurricane"][0]["stormInfo"]["stormName_Nice"]
      x << " Latitude: \n"
      x << @response["currenthurricane"][1]["Current"]["lat"].to_s
      x << " Longitude: \n"
      x << @response["currenthurricane"][1]["Current"]["lon"].to_s
      x << " Wind Speed:\n"
      x << @response["currenthurricane"][1]["Current"]["WindSpeed"].to_s
    x
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/currenthurricane/q/#{@zip}.json")
  end

end
