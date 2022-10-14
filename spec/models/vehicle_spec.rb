require 'rails_helper'

RSpec.describe Vehicle, type: :model do

  describe '#valid?' do
    it 'placa é obrigatória' do
      #Arrange
      vehicle = Vehicle.new(license: '')
      #Act
      vehicle.valid?
      result = vehicle.errors.include?(:license)
      #Assert
      expect(result).to be true
    end

    it 'marca é obrigatória' do
      #Arrange
      vehicle = Vehicle.new(brand: '')
      #Act
      vehicle.valid?
      result = vehicle.errors.include?(:brand)
      #Assert
      expect(result).to be true
    end

    it 'modelo é obrigatório' do
      #Arrange
      vehicle = Vehicle.new(model: '')
      #Act
      vehicle.valid?
      result = vehicle.errors.include?(:model)
      #Assert
      expect(result).to be true
    end

    it 'ano de fabricação é obrigatório' do
      #Arrange
      vehicle = Vehicle.new(year: '')
      #Act
      vehicle.valid?
      result = vehicle.errors.include?(:year)
      #Assert
      expect(result).to be true
    end

    it 'carga máxima é obrigatória' do
      #Arrange
      vehicle = Vehicle.new(max_load: '')
      #Act
      vehicle.valid?
      result = vehicle.errors.include?(:max_load)
      #Assert
      expect(result).to be true
    end

    it 'disponibilidade tem valor padrão' do
      #Arrange
      vehicle = Vehicle.new(availability: '')
      #Act
      vehicle.valid?
      result = vehicle.errors.include?(:availability)
      #Assert
      expect(result).to be false
    end

    it 'ano tem 4 dígitos' do
      #Arrange
      vehicle = Vehicle.new(year: '201')
      #Act
      vehicle.valid?
      result = vehicle.errors.include?(:year)
      #Assert
      expect(result).to be true
    end

    it 'ano tem 4 dígitos' do
      #Arrange
      vehicle = Vehicle.new(year: '20191')
      #Act
      vehicle.valid?
      result = vehicle.errors.include?(:year)
      #Assert
      expect(result).to be true
    end

    it 'carga máxima é maior do que zero' do
      #Arrange
      vehicle = Vehicle.new(max_load: '0')
      #Act
      vehicle.valid?
      result = vehicle.errors.include?(:max_load)
      #Assert
      expect(result).to be true
    end

    it 'placa tem 7 dígitos' do
      #Arrange
      vehicle = Vehicle.new(license: 'ABC123')
      #Act
      vehicle.valid?
      result = vehicle.errors.include?(:license)
      #Assert
      expect(result).to be true
    end

    it 'placa tem 7 dígitos' do
      #Arrange
      vehicle = Vehicle.new(license: 'ABC12345')
      #Act
      vehicle.valid?
      result = vehicle.errors.include?(:license)
      #Assert
      expect(result).to be true
    end

    it 'placa deve ser única' do
      #Arrange
      transport_mode = TransportMode.create!(name: 'Motocicleta', min_distance: 1, max_distance: 100, min_weight: 0, max_weight: 10, fixed_rate: 6)
      vehicle = Vehicle.create!(license: 'CDN3312', brand: 'Honda', model: 'CG Cargo', year: '2021', max_load: '20', transport_mode: transport_mode)
      
      other_vehicle = Vehicle.new(license: 'CDN3312')
      #Act
      other_vehicle.valid?
      result = other_vehicle.errors.include?(:license)
      #Assert
      expect(result).to be true
    end

  end
end
