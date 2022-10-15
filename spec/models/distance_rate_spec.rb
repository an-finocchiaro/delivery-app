require 'rails_helper'

RSpec.describe DistanceRate, type: :model do

  describe '#valid?' do
    it 'Km Inicial é obrigatória' do
      #Arrange
      distance_rate = DistanceRate.new(min_distance_rate: '')
      #Act
      distance_rate.valid?
      result = distance_rate.errors.include?(:min_distance_rate)
      #Assert
      expect(result).to be true
    end

    it 'Km Final é obrigatória' do
      #Arrange
      distance_rate = DistanceRate.new(max_distance_rate: '')
      #Act
      distance_rate.valid?
      result = distance_rate.errors.include?(:max_distance_rate)
      #Assert
      expect(result).to be true
    end

    it 'Taxa é obrigatória' do
      #Arrange
      distance_rate = DistanceRate.new(price: '')
      #Act
      distance_rate.valid?
      result = distance_rate.errors.include?(:price)
      #Assert
      expect(result).to be true
    end
    
  end
end
