require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#valid?' do
    it 'e-mail institucional é obrigatório' do
      #Arrange
      user = User.new(name: 'Ana Costa', email: 'ana@sistemdefrete.com', password: 'password')
      #Act
      result = user.valid?
      #Assert
      expect(result).to be false
    end
  end

  
end
