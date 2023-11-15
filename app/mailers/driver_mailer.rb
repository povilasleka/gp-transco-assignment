
class DriverMailer < ApplicationMailer
  def weather_alerts
    @driver = params[:driver]
    @alerts = params[:alerts]
    mail(to: @driver.email, subject: "8AM Weather Alerts")
  end
end