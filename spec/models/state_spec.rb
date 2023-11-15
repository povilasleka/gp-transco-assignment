require 'rails_helper'

RSpec.describe State, type: :model do
    describe 'associations' do
        it { should have_many(:gps_entries) }
    end

    describe 'validations' do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:timezone) }
    end

    describe 'methods' do
        fixtures :states, :drivers

        describe '#drivers_in_state' do
            let(:state) { states(:state1) }
            let(:driver) { drivers(:driver1) }

            before do
                driver.update(current_state_name: state.name)
            end

            it 'returns drivers in the state' do
                expect(state.drivers_in_state).to eq([driver])
            end
        end
    end
end