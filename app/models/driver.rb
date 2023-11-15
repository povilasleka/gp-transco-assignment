class Driver < ApplicationRecord
    has_many :gps_entries

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :license_plate, presence: true
    validates :current_state_name, inclusion: { in: State::NAMES }, allow_nil: true
    validates :email, presence: true

    def send_weather_alerts(weather_alerts)
        if weather_alerts.length > 0
            DriverMailer.with(driver: self, alerts: weather_alerts).weather_alerts.deliver_now
        end
    end
end
