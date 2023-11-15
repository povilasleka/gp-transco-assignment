class Driver < ApplicationRecord
    has_many :gps_entries

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :license_plate, presence: true
    validates :current_state_name, inclusion: { in: State::NAMES }, allow_nil: true

    def current_state
        return unless current_state_name.present?

        State.find_by(name: current_state_name)
    end

    def current_time
        return unless current_state_name.present?
        
        State.find_by(name: current_state_name)&.current_time
    end

    def send_weather_alerts
        weather_alerts = gps_entries.last.state.weather_alerts

        if weather_alerts.length > 0
            # TODO: Send weather alerts to driver
        end
    end
end
