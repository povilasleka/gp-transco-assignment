
require 'rails_helper'

RSpec.describe DriverMailer, type: :mailer do
    describe "weather_alerts" do
        let(:driver) { Driver.new(
            first_name: "John",
            last_name: "Doe",
            license_plate: "1234567890",
            email: "john.doe@gptransco.driver.com"
        ) }

        let(:weather_alerts) {
            weather_alerts = JSON.parse(File.read('spec/fixtures/weather_alerts.json'))
            [WeatherAlertMessage.new(weather_alerts["features"][0]["properties"])]
        }

        let(:mail) { described_class.with(driver: driver, alerts: weather_alerts).weather_alerts }

        it 'sets `to` header correctly' do
            expect(mail.to).to eq([driver.email])
        end

        it 'renders headline' do
            expect(mail.body.encoded).to match(weather_alerts.first&.headline)
        end

        it 'renders area_desc' do
            expect(mail.body.encoded).to match(weather_alerts.first&.area_desc)
        end

        # it 'renders body with description' do
        #     expect(mail.body.encoded).to match(weather_alerts.first&.description)
        # end
        #
        # it 'renders body with instruction' do
        #     expect(mail.body.encoded).to match(weather_alerts.first&.instruction)
        # end

        it 'renders effective date' do
            expect(mail.body.encoded).to match(weather_alerts.first&.effective)
        end

        it 'renders expiration date' do
            expect(mail.body.encoded).to match(weather_alerts.first&.expires)
        end

        it 'renders severity' do
            expect(mail.body.encoded).to match(weather_alerts.first&.severity)
        end
    end
end