require 'httparty'
require 'byebug'


class Alertas
  def initialize (zip)
    @zip = zip
    @response = get_response
  end

  def alerts_method
    if @response["alerts"] != []
      @response["alerts"][0]["type"]
    else
      puts "There are no weather alerts in your area."
    end
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/alerts/q/#{@zip}.json")
  end

end
