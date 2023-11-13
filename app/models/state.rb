class State < ApplicationRecord
    has_many :gps_entries

    validates :name, presence: true
    validates :timezone, presence: true

    def current_time
        Time.now.in_time_zone(self.timezone)
    end

    def weather_alerts
        WeatherService.new.get_weather_alerts(self.name)
    end
end
