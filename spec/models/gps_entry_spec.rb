require 'rails_helper'

RSpec.describe GpsEntry, type: :model do
    fixtures :drivers, :states

    describe "callbacks" do
        describe "after_create" do
            describe "#update_driver_state_name" do
                let(:driver) { drivers(:driver1) }
                let(:state) { states(:state1) }

                it "updates driver's current_state_name" do
                    expect {
                        GpsEntry.create(
                            driver: driver,
                            state: state,
                            lat: 0,
                            lng: 0
                        )
                    }.to change { driver.reload.current_state_name }.from(nil).to(state.name)
                end
            end
        end
    end

    it { is_expected.to validate_presence_of :driver }
    it { is_expected.to validate_presence_of :state }
    it { is_expected.to validate_presence_of :lat }
    it { is_expected.to validate_presence_of :lng }
end