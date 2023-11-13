class GpsEntry < ApplicationRecord
    belongs_to :state
    belongs_to :driver
end
