
# This class provides methods to fetch weather alerts from the National Weather Service API.

class WeatherAlertsReader 
    def initialize(state, options = {})
        @api_url = "https://api.weather.gov/alerts/active"
        @state = state
        @options = options
    end

    def read_alerts
        raise ArgumentError, "Invalid state string. Expected 2 symbols abbreviation." unless State::NAMES.include?(@state)

        response = Faraday.get("#{@api_url}?#{params.to_query}")

        if response.success?
            json = JSON.parse(response.body)
            json["features"].map { |alert| WeatherAlertMessage.new(alert["properties"]) }
        else
            raise StandardError, "Failed to fetch weather alerts: #{response.status}"
        end
    end

    private

    def params
        {
            area: @state,
            severity: @options[:severity] || "Severe,Extreme",
        }
    end
end