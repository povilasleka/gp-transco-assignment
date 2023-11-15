class GpsEntry < ApplicationRecord
    belongs_to :state
    belongs_to :driver

    validates :lat, presence: true
    validates :lng, presence: true
    validates :state, presence: true
    validates :driver, presence: true

    after_create :update_driver_state_name

    private

    def update_driver_state_name
        driver.update(current_state_name: state.name)
    end
end
