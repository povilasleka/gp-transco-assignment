
class DriverMailer < ApplicationMailer
  def weather_alerts
    @driver = params[:driver]
    @alerts = params[:alerts]
    mail(to: @driver.email, subject: "Weather alerts in your location")
  end
end