class State < ApplicationRecord
    has_many :gps_entries

    validates :name, presence: true
    validates :timezone, presence: true

    NAMES = %w[AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY].freeze

    def current_time
        Time.now.in_time_zone(self.timezone)
    end

    def drivers_in_state
        Driver.where(current_state_name: self.name)
    end

    def weather_alerts
        WeatherAlertsReader.new(self.name).read_alerts
    end
end
