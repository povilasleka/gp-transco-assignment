require 'rails_helper'

describe WeatherAlertsReader do
    describe '#read_alerts' do 
        let(:state) { 'CA' }
        let(:api_url) { "https://api.weather.gov/alerts/active?area=#{state}&severity=Severe,Extreme" }
        let(:weather_alerts_reader) { WeatherAlertsReader.new(state) }

        context 'when us state string is invalid' do
            let(:weather_alerts_reader) { WeatherAlertsReader.new('XX') }

            it 'raises an ArgumentError' do
                expect { weather_alerts_reader.read_alerts }.to raise_error(ArgumentError)
            end
        end

        context 'when the request is successful' do
            before do
                stub_request(:get, api_url)
                    .to_return(status: 200, body: File.read('spec/fixtures/weather_alerts.json'))
            end

            it 'returns an array of WeatherAlertMessage objects' do
                alerts = weather_alerts_reader.read_alerts
                expect(alerts).to be_an(Array)
                expect(alerts.first).to be_a(WeatherAlertMessage)
            end
        end

        context 'when the request is successful but there are no alerts' do
            before do
                stub_request(:get, api_url)
                    .to_return(status: 200, body: "{\"@context\":{\"@version\":\"1.1\"},\"type\":\"FeatureCollection\",\"features\":[],\"title\":\"Currentwatches,warnings,andadvisoriesforNewYork\",\"updated\":\"2023-11-13T14:12:00+00:00\"}")
            end

            it 'returns an empty array' do
                alerts = weather_alerts_reader.read_alerts
                expect(alerts).to be_an(Array)
                expect(alerts).to be_empty
            end
        end

        context 'when the request is unsuccessful' do
            before do
                stub_request(:get, api_url)
                    .to_return(status: 400, body: '')
            end

            it 'raises a StandardError with an error message' do
                expect { weather_alerts_reader.read_alerts }.to raise_error(StandardError)
            end
        end
    end
end