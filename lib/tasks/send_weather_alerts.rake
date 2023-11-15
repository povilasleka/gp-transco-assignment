task :send_weather_alerts => [ :environment ] do
    State.by_local_time_hour(8) do |state|
        alerts = state.weather_alerts

        next if alerts.blank?

        puts "[!] Weather alert in #{state.name}"

        drivers_currently_in_state = Driver.where(current_state_name: state.name)
        drivers_currently_in_state.find_each do |driver|
            DriverMailer.with(driver: driver, alerts: alerts).weather_alerts.deliver_now
        end

        puts "Sending alerts to #{drivers_currently_in_state.count} drivers currently in #{state.name}"
    end
end