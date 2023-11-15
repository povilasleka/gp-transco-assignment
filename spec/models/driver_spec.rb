require 'rails_helper'

RSpec.describe Driver, :type => :model do
    fixtures :drivers

    let(:driver) { drivers(:driver1) }

    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :license_plate }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_inclusion_of(:current_state_name).in_array(State::NAMES).allow_nil }
end