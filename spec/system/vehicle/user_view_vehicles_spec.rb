require 'rails_helper'

describe 'Usuário vê índice de veículos' do
  it 'com sucesso' do
    user = User.create!(name: 'Pedro Matos', email: 'pedro@sistemadefrete.com', password: 'password')
    transport_mode = TransportMode.create!(name: 'Motocicleta', min_distance: 1, max_distance: 100, min_weight: 0, max_weight: 10, fixed_rate: 6)
    other_transport_mode = TransportMode.create!(name: 'Furgão', min_distance: 10, max_distance: 400, min_weight: 0, max_weight: 650, fixed_rate: 40)
    another_transport_mode = TransportMode.create!(name: 'Caminhão', min_distance: 30, max_distance: 2000, min_weight: 0, max_weight: 7000, fixed_rate: 130)
    vehicle = Vehicle.create!(license: 'CDN3312', brand: 'Honda', model: 'CG Cargo', year: '2021', max_load: '20', transport_mode: transport_mode)
    other_vehicle = Vehicle.create!(license: 'ABC1234', brand: 'Fiat', model: 'Fiorino', year: '2020', max_load: '650', transport_mode: other_transport_mode)
    another_vehicle = Vehicle.create!(license: 'ZIA4437', brand: 'Ford', model: 'Cargo 816', year: '2019', max_load: '7000', transport_mode: another_transport_mode)
    #Act
    login_as(user)
    visit root_path
    click_on 'Veículos'
    #Assert
    expect(page).to have_content 'Veículos Cadastrados'
    expect(page).to have_content 'Modalidade de Transporte: Motocicleta'
    expect(page).to have_content 'Modalidade de Transporte: Furgão'
    expect(page).to have_content 'Modalidade de Transporte: Caminhão'
    expect(page).to have_content 'Placa: CDN3312'
    expect(page).to have_content 'Placa: ABC1234'
    expect(page).to have_content 'Placa: ZIA4437'
    expect(page).to have_content 'Marca: Honda'
    expect(page).to have_content 'Modelo: Fiorino'
    expect(page).to have_content 'Modelo: Cargo 816'
  end

  it 'e vê detalhes de um veículo' do
    user = User.create!(name: 'Pedro Matos', email: 'pedro@sistemadefrete.com', password: 'password')
    transport_mode = TransportMode.create!(name: 'Furgão', min_distance: 10, max_distance: 400, min_weight: 0, max_weight: 650, fixed_rate: 40)
    vehicle = Vehicle.create!(license: 'ABC1234', brand: 'Fiat', model: 'Fiorino', year: '2020', max_load: '650', transport_mode: transport_mode)
    #Act
    login_as(user)
    visit root_path
    click_on 'Veículos'
    click_on 'ABC1234'
    #Assert
    expect(page).to have_content 'Informações do Veículo'
    expect(page).to have_content 'Modalidade de Transporte: Furgão'
    expect(page).to have_content 'Placa: ABC1234'
    expect(page).to have_content 'Marca: Fiat'
    expect(page).to have_content 'Modelo: Fiorino'
    expect(page).to have_content 'Ano de Fabricação: 2020'
    expect(page).to have_content 'Capacidade Máxima de Carga: 650 kg'
  end

  it 'e não vê link para editar um veículo' do
    user = User.create!(name: 'Pedro Matos', email: 'pedro@sistemadefrete.com', password: 'password')
    transport_mode = TransportMode.create!(name: 'Furgão', min_distance: 10, max_distance: 400, min_weight: 0, max_weight: 650, fixed_rate: 40)
    vehicle = Vehicle.create!(license: 'ABC1234', brand: 'Fiat', model: 'Fiorino', year: '2020', max_load: '650', transport_mode: transport_mode)
    #Act
    login_as(user)
    visit root_path
    click_on 'Veículos'
    click_on 'ABC1234'
    #Assert
    expect(page).not_to have_link 'Editar'
  end
end