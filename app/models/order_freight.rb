class OrderFreight < ApplicationRecord
  belongs_to :order
  has_many :transport_modes
 
end
