require 'httparty'
require 'byebug'


class CurrentHurricane
  def initialize (zip)
    @zip = zip
    @response = get_response
  end

  def storm
    x = ""
      (@response["currenthurricane"]).each do |hurricane|
      x << hurricane["stormInfo"]["stormName_Nice"]
      x << " Latitude: \n"
      x << hurricane["Current"]["lat"].to_s
      x << " Longitude: \n"
      x << hurricane["Current"]["lon"].to_s
      x << " Wind Speed:\n"
      x << hurricane["Current"]["WindSpeed"].to_s
      x << "\n \n"
    end
    x
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/currenthurricane/q/#{@zip}.json")
  end

end
