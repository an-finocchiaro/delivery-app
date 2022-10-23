class OrderFreight < ApplicationRecord
  belongs_to :transport_mode
  belongs_to :order
end
