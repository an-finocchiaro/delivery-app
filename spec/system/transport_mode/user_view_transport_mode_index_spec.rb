require 'rails_helper'

describe 'Usuário regular vê índice de Modalidades de Transporte' do
  it 'com sucesso' do
    #Arrange
    user = User.create!(name: 'Pedro Matos', email: 'pedro@sistemadefrete.com', password: 'password')
    transport_mode = TransportMode.create!(name: 'Bicicleta', min_distance: 1, max_distance: 15, min_weight: 0, max_weight: 6, fixed_rate: 5)
    other_transport_mode = TransportMode.create!(name: 'Motocicleta', min_distance: 1, max_distance: 80, min_weight: 0, max_weight: 11, fixed_rate: 6)
    #Act
    login_as(user)
    visit root_path
    click_on 'Modalidades de Transporte'
    #Assert
    expect(page).to have_content 'Modalidades de Transporte Disponíveis'
    expect(page).to have_content 'Bicicleta'
    expect(page).to have_content 'Distância Mínima: 1 km'
    expect(page).to have_content 'Distância Máxima: 15 km'
    expect(page).to have_content 'Peso Mínimo: 0 kg'
    expect(page).to have_content 'Peso Máximo: 6 kg'
    expect(page).to have_content 'Taxa Fixa: R$ 5,00'
    expect(page).to have_content 'Status: Ativa'
    expect(page).to have_content 'Motocicleta'
    expect(page).to have_content 'Distância Máxima: 80 km'
    expect(page).to have_content 'Peso Máximo: 11 kg'
    expect(page).to have_content 'Taxa Fixa: R$ 6,00'
  end

  it 'e vê detalhes da Modalidade' do
    #Arrange
    user = User.create!(name: 'Pedro Matos', email: 'pedro@sistemadefrete.com', password: 'password')
    transport_mode = TransportMode.create!(name: 'Bicicleta', min_distance: 1, max_distance: 15, min_weight: 0, max_weight: 6, fixed_rate: 5)
    #Act
    login_as(user)
    visit root_path
    click_on 'Modalidades de Transporte'
    click_on 'Bicicleta'
    #Assert
    expect(page).to have_content 'Modalidade de Transporte: Bicicleta'
    expect(page).to have_content 'Distância Mínima: 1 km'
    expect(page).to have_content 'Distância Máxima: 15 km'
    expect(page).to have_content 'Peso Mínimo: 0 kg'
    expect(page).to have_content 'Peso Máximo: 6 kg'
    expect(page).to have_content 'Taxa Fixa: R$ 5,00'
    expect(page).to have_content 'Status: Ativa'
  end

  it 'e não tem acesso para cadastrar Nova Modalidade' do
    #Arrange
    user = User.create!(name: 'Pedro Matos', email: 'pedro@sistemadefrete.com', password: 'password')
    transport_mode = TransportMode.create!(name: 'Bicicleta', min_distance: 1, max_distance: 15, min_weight: 0, max_weight: 6, fixed_rate: 5)
    #Act
    login_as(user)
    visit root_path
    click_on 'Modalidades de Transporte'
    #Assert
    expect(page).to have_content 'Modalidades de Transporte Disponíveis'
    expect(page).not_to have_link 'Cadastrar Nova Modalidade'
  end

  it 'e não tem acesso para editar Modalidade' do
    #Arrange
    user = User.create!(name: 'Pedro Matos', email: 'pedro@sistemadefrete.com', password: 'password')
    transport_mode = TransportMode.create!(name: 'Bicicleta', min_distance: 1, max_distance: 15, min_weight: 0, max_weight: 6, fixed_rate: 5)
    #Act
    login_as(user)
    visit root_path
    click_on 'Modalidades de Transporte'
    click_on 'Bicicleta'
    #Assert
    expect(page).to have_content 'Modalidade de Transporte: Bicicleta'
    expect(page).not_to have_link 'Editar'
  end
end