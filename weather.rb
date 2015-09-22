require 'json'
require 'byebug'
require './current_conditions'
require './10dayforecast'
require './sunriseset'
require './hurricane'
require './alerts'

puts "Welcome to Weather Report"

puts "Enter your zip code:"
zip = gets.chomp
current_conditions = CurrentConditions.new(zip)
ten_day_cast = TenDayCast.new(zip)
sunrisets = SunRiseSet.new(zip)
hurricanes_now = CurrentHurricane.new(zip)
alerts_now = Alertas.new(zip)

puts "The weather in #{current_conditions.full} will be: #{current_conditions.weather}. The temperature will be: #{current_conditions.temp}4"

puts "The sun will rise at #{sunrisets.sunrise}"

puts "The sun will set at #{sunrisets.sunset}"

puts "#{alerts_now.alerts_method}"

puts "Here are the hurricanes happening all over the WORLD. RIGHT. NOW. \n #{hurricanes_now.storm}"

puts "Your ten day forecast is as follows: \n"  "\n"
puts "#{ten_day_cast.ten_day}"
