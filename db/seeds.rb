states = [
    { name: "AL", timezone: "America/Chicago" },
    { name: "AK", timezone: "America/Anchorage" },
    { name: "AZ", timezone: "America/Phoenix" },
    { name: "AR", timezone: "America/Chicago" },
    { name: "CA", timezone: "America/Los_Angeles" },
    { name: "CO", timezone: "America/Denver" },
    { name: "CT", timezone: "America/New_York" },
    { name: "DE", timezone: "America/New_York" },
    { name: "FL", timezone: "America/New_York" },
    { name: "GA", timezone: "America/New_York" },
    { name: "HI", timezone: "Pacific/Honolulu" },
    { name: "ID", timezone: "America/Boise" },
    { name: "IL", timezone: "America/Chicago" },
    { name: "IN", timezone: "America/Indiana/Indianapolis" },
    { name: "IA", timezone: "America/Chicago" },
    { name: "KS", timezone: "America/Chicago" },
    { name: "KY", timezone: "America/Kentucky/Louisville" },
    { name: "LA", timezone: "America/Chicago" },
    { name: "ME", timezone: "America/New_York" },
    { name: "MD", timezone: "America/New_York" },
    { name: "MA", timezone: "America/New_York" },
    { name: "MI", timezone: "America/Detroit" },
    { name: "MN", timezone: "America/Chicago" },
    { name: "MS", timezone: "America/Chicago" },
    { name: "MO", timezone: "America/Chicago" },
    { name: "MT", timezone: "America/Denver" },
    { name: "NE", timezone: "America/Chicago" },
    { name: "NV", timezone: "America/Los_Angeles" },
    { name: "NH", timezone: "America/New_York" },
    { name: "NJ", timezone: "America/New_York" },
    { name: "NM", timezone: "America/Denver" },
    { name: "NY", timezone: "America/New_York" },
    { name: "NC", timezone: "America/New_York" },
    { name: "ND", timezone: "America/North_Dakota/Center" },
    { name: "OH", timezone: "America/New_York" },
    { name: "OK", timezone: "America/Chicago" },
    { name: "OR", timezone: "America/Los_Angeles" },
    { name: "PA", timezone: "America/New_York" },
    { name: "RI", timezone: "America/New_York" },
    { name: "SC", timezone: "America/New_York" },
    { name: "SD", timezone: "America/Chicago" },
    { name: "TN", timezone: "America/Chicago" },
    { name: "TX", timezone: "America/Chicago" },
    { name: "UT", timezone: "America/Denver" },
    { name: "VT", timezone: "America/New_York" },
    { name: "VA", timezone: "America/New_York" },
    { name: "WA", timezone: "America/Los_Angeles" },
    { name: "WV", timezone: "America/New_York" },
    { name: "WI", timezone: "America/Chicago" },
    { name: "WY", timezone: "America/Denver" }
]

drivers = [
    { first_name: "John", last_name: "Doe", license_plate: "ABC123", email: "john.doe@gptransco.driver.com" },
    { first_name: "Jane", last_name: "Doe", license_plate: "XYZ789", email: "jane.doe@gptransco.driver.com" },
    { first_name: "Bob", last_name: "Smith", license_plate: "QWE456", email: "bob.smith@gptransco.driver.com" },
]

gps_entries = [
    { lat: 41.8781000, lng: -87.6298000, state_id: 13, driver_id: 1 },
    { lat: 43.9050828, lng: -113.7154089, state_id: 6, driver_id: 1 },
    { lat: 41.8781000, lng: -87.6298000, state_id: 13, driver_id: 2 },
]

states.each do |state|
    State.find_or_create_by(state)
end

drivers.each do |driver|
    Driver.find_or_create_by(driver)
end

gps_entries.each do |gps_entry|
    GpsEntry.find_or_create_by(gps_entry)
end