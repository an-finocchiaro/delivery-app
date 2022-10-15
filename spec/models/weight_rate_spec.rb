require 'rails_helper'

RSpec.describe WeightRate, type: :model do

  describe '#valid?' do
    it 'Peso Inicial é obrigatório' do
      #Arrange
      weight_rate = WeightRate.new(min_weight_range: '')
      #Act
      weight_rate.valid?
      result = weight_rate.errors.include?(:min_weight_range)
      #Assert
      expect(result).to be true
    end

    it 'Peso Final é obrigatório' do
      #Arrange
      weight_rate = WeightRate.new(max_weight_range: '')
      #Act
      weight_rate.valid?
      result = weight_rate.errors.include?(:max_weight_range)
      #Assert
      expect(result).to be true
    end

    it 'Peso Final é obrigatório' do
      #Arrange
      weight_rate = WeightRate.new(price_kg: '')
      #Act
      weight_rate.valid?
      result = weight_rate.errors.include?(:price_kg)
      #Assert
      expect(result).to be true
    end
  end
end
