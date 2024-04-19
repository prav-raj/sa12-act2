require 'httparty'
require 'json'

def fetch_current_time(area, location)
  url = "http://worldtimeapi.org/api/timezone/#{area}/#{location}"

  response = HTTParty.get(url)

  if response.code == 200
    time_data = JSON.parse(response.body)

    datetime = Time.parse(time_data['datetime'])

    formatted_time = datetime.strftime("%Y-%m-%d %H:%M:%S")
    puts "The current time in #{area}/#{location} is #{formatted_time}"
  else
    puts "Failed to retrieve data. Please check the area and location."
  end
end

fetch_current_time('Europe', 'London')
