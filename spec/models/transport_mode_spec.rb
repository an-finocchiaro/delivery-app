require 'rails_helper'

RSpec.describe TransportMode, type: :model do

  describe '#valid?' do
    it 'nome é obrigatório' do
      #Arrange
      transport_mode = TransportMode.new(name: '')
      #Act
      transport_mode.valid?
      result = transport_mode.errors.include?(:name)
      #Assert
      expect(result).to be true
    end

    it 'distância mínima é obrigatória' do
      #Arrange
      transport_mode = TransportMode.new(min_distance: '')
      #Act
      transport_mode.valid?
      result = transport_mode.errors.include?(:min_distance)
      #Assert
      expect(result).to be true
    end

    it 'distância mínima deve ser maior do que zero' do
      #Arrange
      transport_mode = TransportMode.new(min_distance: 0)
      #Act
      transport_mode.valid?
      result = transport_mode.errors.include?(:min_distance)
      #Assert
      expect(result).to be true
    end

    it 'distância máxima é obrigatória' do
      #Arrange
      transport_mode = TransportMode.new(max_distance: '')
      #Act
      transport_mode.valid?
      result = transport_mode.errors.include?(:max_distance)
      #Assert
      expect(result).to be true
    end

    it 'distância máxima deve ser maior do que zero' do
      #Arrange
      transport_mode = TransportMode.new(max_distance: 0)
      #Act
      transport_mode.valid?
      result = transport_mode.errors.include?(:max_distance)
      #Assert
      expect(result).to be true
    end

    it 'peso mínimo é obrigatório' do
      #Arrange
      transport_mode = TransportMode.new(min_weight: '')
      #Act
      transport_mode.valid?
      result = transport_mode.errors.include?(:min_weight)
      #Assert
      expect(result).to be true
    end

    it 'peso máximo é obrigatório' do
      #Arrange
      transport_mode = TransportMode.new(max_weight: '')
      #Act
      transport_mode.valid?
      result = transport_mode.errors.include?(:max_weight)
      #Assert
      expect(result).to be true
    end

    it 'peso máximo deve ser maior do que zero' do
      #Arrange
      transport_mode = TransportMode.new(max_weight: 0)
      #Act
      transport_mode.valid?
      result = transport_mode.errors.include?(:max_weight)
      #Assert
      expect(result).to be true
    end

    it 'taxa fixa é obrigatória' do
      #Arrange
      transport_mode = TransportMode.new(fixed_rate: '')
      #Act
      transport_mode.valid?
      result = transport_mode.errors.include?(:fixed_rate)
      #Assert
      expect(result).to be true
    end

    it 'taxa fixa deve ser maior do que zero' do
      #Arrange
      transport_mode = TransportMode.new(fixed_rate: 0)
      #Act
      transport_mode.valid?
      result = transport_mode.errors.include?(:fixed_rate)
      #Assert
      expect(result).to be true
    end
  end
end
