class DeliveryDeadline < ApplicationRecord
  before_action :authenticate_user!
  belongs_to :transport_mode
end
