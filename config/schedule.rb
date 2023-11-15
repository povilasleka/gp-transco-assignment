ENV.each { |k, v| env(k, v) }
set :output, "./log/cron.log"

every :hour do
    rake 'send_weather_alerts'
end