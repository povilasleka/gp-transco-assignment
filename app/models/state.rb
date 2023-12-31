class State < ApplicationRecord
    has_many :gps_entries

    validates :name, presence: true
    validates :timezone, presence: true

    scope :by_local_time_hour, ->(hour) {
        # This code retrieves all the states every time it runs,
        # but as there is only 50 (fixed number) states, there is no problem.
        all.select { |state| state.local_time.hour == hour.to_i }
    }

    NAMES = %w[AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY].freeze

    def local_time
        Time.now.in_time_zone(self.timezone)
    end

    def drivers_in_state
        Driver.where(current_state_name: self.name)
    end

    def weather_alerts
        WeatherAlertsReader.new(self.name).read_alerts
    end
end
