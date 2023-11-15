require 'rails_helper'

RSpec.describe Driver, :type => :model do
    fixtures :drivers

    let(:driver) { drivers(:driver1) }

    it 'is valid with valid attributes' do
        expect(driver).to be_valid
    end

    it 'becomes invalid without a first name' do
        driver.first_name = nil

        expect(driver).to_not be_valid
    end

    it 'becomes invalid without a last name' do
        driver.last_name = nil

        expect(driver).to_not be_valid
    end

    it 'becomes invalid without a license plate' do
        driver.license_plate = nil

        expect(driver).to_not be_valid
    end
end