require 'rails_helper'

RSpec.describe DeliveryDeadline, type: :model do

  describe '#valid?' do
    it 'Distância Mínima é obrigatória' do
      #Arrange
      delivery_deadline = DeliveryDeadline.new(min_delivery_distance: '')
      #Act
      delivery_deadline.valid?
      result = delivery_deadline.errors.include?(:min_delivery_distance)
      #Assert
      expect(result).to be true
    end

    it 'Distância Máxima é obrigatória' do
      #Arrange
      delivery_deadline = DeliveryDeadline.new(max_delivery_distance: '')
      #Act
      delivery_deadline.valid?
      result = delivery_deadline.errors.include?(:max_delivery_distance)
      #Assert
      expect(result).to be true
    end

    it 'Prazo de Entrega é obrigatório' do
      #Arrange
      delivery_deadline = DeliveryDeadline.new(deadline: '')
      #Act
      delivery_deadline.valid?
      result = delivery_deadline.errors.include?(:deadline)
      #Assert
      expect(result).to be true
    end
  end
end
