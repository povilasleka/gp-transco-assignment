class Driver < ApplicationRecord
    has_many :gps_entries

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :license_plate, presence: true

    def current_state
        gps_entries&.last&.state
    end

    def current_time
        gps_entries&.last&.state&.current_time
    end

    def send_weather_alerts
        weather_alerts = gps_entries.last.state.weather_alerts

        if weather_alerts.length > 0
            # TODO: Send weather alerts to driver
        end
    end
end
