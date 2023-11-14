require 'rails_helper'

RSpec.describe Driver, :type => :model do
    let(:driver) { Driver.new(first_name: 'John', last_name: 'Doe', license_plate: 'ABC123') }

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

    context 'when driver has a gps entry' do
        let(:state) { State.new(name: 'CA', timezone: 'America/Los_Angeles') }
        let(:gps_entry) { GpsEntry.new(state: state) }
        let(:driver) { Driver.new(first_name: 'John', last_name: 'Doe', license_plate: 'ABC123', gps_entries: [gps_entry]) }

        describe '#current_state' do
            it 'returns the current state of the driver from the last gps entry' do
                expect(driver.current_state).to eq(state)
            end
        end

        describe '#current_time' do
            let(:time_now) { Time.now }

            it 'returns the current local time of the driver from the last gps entry' do
                allow(Time).to receive(:now).and_return(time_now)

                expect(driver.current_time).to eq(Time.now.in_time_zone(state.timezone))
            end
        end
    end

    context 'when driver has no gps entries' do
        let(:driver) { Driver.new(first_name: 'John', last_name: 'Doe', license_plate: 'ABC123') }

        describe '#current_state' do
            it 'returns nil' do
                expect(driver.current_state).to be_nil
            end
        end

        describe '#current_time' do
            it 'returns nil' do
                expect(driver.current_time).to be_nil
            end
        end
    end
end