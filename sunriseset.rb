require 'httparty'
require 'byebug'


class SunRiseSet
  def initialize (zip)
    @zip = zip
    @response = get_response
  end

  def sunrise
    sr = ""
    sr << @response["moon_phase"]["sunrise"]["hour"]
    sr << ":"
    sr << @response["moon_phase"]["sunrise"]["minute"]
    sr
  end

  def sunset
    ss = ""
    ss << @response["moon_phase"]["sunset"]["hour"]
    ss << ":"
    ss << @response["moon_phase"]["sunset"]["minute"]
    ss  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/astronomy/q/#{@zip}.json")
  end

end
