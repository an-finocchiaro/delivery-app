require 'rails_helper'

RSpec.describe Order, type: :model do

  describe 'Gera um código aleatório de identificação com 15 dígitos' do
    it 'ao criar uma nova Ordem de Serviço' do
      
      user = User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password', role: 1)
      order = Order.new(user: user, pickup_address: 'Rua Alvilândia, 120 ', pickup_zipcode: '05045-000', pickup_city: 'São Paulo', pickup_state: 'SP', product_code: 'ABC-6732', product_dimension: 10, product_weight: 11, recipient_name: 'Maria Moraes', recipient_phone: '(11) 93444-2233', deliver_address: 'Rua do Rocio, 720', delivery_zipcode: '04570-000', delivery_city: 'São Paulo', delivery_state: 'SP', delivery_distance: 20)
     
      order.save!
      result = order.code
     
      expect(result).not_to be_empty
      expect(result.length).to eq 15
    end

    it 'e o código é único' do
      user = User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password', role: 1)
      order = Order.create!(user: user, pickup_address: 'Rua Alvilândia, 120 ', pickup_zipcode: '05045-000', pickup_city: 'São Paulo', pickup_state: 'SP', product_code: 'ABC-6732', product_dimension: 10, product_weight: 11, recipient_name: 'Maria Moraes', recipient_phone: '(11) 93444-2233', deliver_address: 'Rua do Rocio, 720', delivery_zipcode: '04570-000', delivery_city: 'São Paulo', delivery_state: 'SP', delivery_distance: 20)
      other_order = Order.new(user: user, pickup_address: 'Rua Barra Funda, 400 ', pickup_zipcode: '03215-000', pickup_city: 'São Paulo', pickup_state: 'SP', product_code: 'XVZ-1234', product_dimension: 5, product_weight: 4, recipient_name: 'José Abreu', recipient_phone: '(11) 99812-3312', deliver_address: 'Rua Carmem, 300', delivery_zipcode: '04574-000', delivery_city: 'São Paulo', delivery_state: 'SP', delivery_distance: 12)

      other_order.save!
      
      expect(other_order.code).not_to eq order.code
    end
  end

  describe '#valid?' do

    it 'endereço de retirada é obrigatório' do
      #Arrange
      order = Order.new(pickup_address: '')
      #Act
      order.valid?
      result = order.errors.include?(:pickup_address)
      #Assert
      expect(result).to be true
    end

    it 'cep de retirada é obrigatório' do
      #Arrange
      order = Order.new(pickup_zipcode: '')
      #Act
      order.valid?
      result = order.errors.include?(:pickup_zipcode)
      #Assert
      expect(result).to be true
    end

    it 'Cidade de retirada é obrigatória' do
      #Arrange
      order = Order.new(pickup_city: '')
      #Act
      order.valid?
      result = order.errors.include?(:pickup_city)
      #Assert
      expect(result).to be true
    end

    it 'Estado de retirada é obrigatório' do
      #Arrange
      order = Order.new(pickup_state: '')
      #Act
      order.valid?
      result = order.errors.include?(:pickup_state)
      #Assert
      expect(result).to be true
    end

    it 'código do produto é obrigatório' do
      #Arrange
      order = Order.new(product_code: '')
      #Act
      order.valid?
      result = order.errors.include?(:product_code)
      #Assert
      expect(result).to be true
    end

    it 'dimensão do produto é obrigatória' do
      #Arrange
      order = Order.new(product_dimension: '')
      #Act
      order.valid?
      result = order.errors.include?(:product_dimension)
      #Assert
      expect(result).to be true
    end

    it 'peso do produto é obrigatório' do
      #Arrange
      order = Order.new(product_weight: '')
      #Act
      order.valid?
      result = order.errors.include?(:product_weight)
      #Assert
      expect(result).to be true
    end

    it 'nome do destinatário é obrigatório' do
      #Arrange
      order = Order.new(recipient_name: '')
      #Act
      order.valid?
      result = order.errors.include?(:recipient_name)
      #Assert
      expect(result).to be true
    end

    it 'telefone do destinatário é obrigatório' do
      #Arrange
      order = Order.new(recipient_phone: '')
      #Act
      order.valid?
      result = order.errors.include?(:recipient_phone)
      #Assert
      expect(result).to be true
    end

    it 'endereço de entrega é obrigatório' do
      #Arrange
      order = Order.new(deliver_address: '')
      #Act
      order.valid?
      result = order.errors.include?(:deliver_address)
      #Assert
      expect(result).to be true
    end

    it 'cep de entrega é obrigatório' do
      #Arrange
      order = Order.new(delivery_zipcode: '')
      #Act
      order.valid?
      result = order.errors.include?(:delivery_zipcode)
      #Assert
      expect(result).to be true
    end

    it 'cidade de entrega é obrigatória' do
      #Arrange
      order = Order.new(delivery_city: '')
      #Act
      order.valid?
      result = order.errors.include?(:delivery_city)
      #Assert
      expect(result).to be true
    end

    it 'Estado de entrega é obrigatório' do
      #Arrange
      order = Order.new(delivery_state: '')
      #Act
      order.valid?
      result = order.errors.include?(:delivery_state)
      #Assert
      expect(result).to be true
    end

    it 'distância total é obrigatória' do
      #Arrange
      order = Order.new(delivery_distance: '')
      #Act
      order.valid?
      result = order.errors.include?(:delivery_distance)
      #Assert
      expect(result).to be true
    end
  end
end
