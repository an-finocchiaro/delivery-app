require 'rails_helper'

describe 'Administrador edita um veículo' do
  it 'com sucesso' do
    #Arrange
    user = User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password', role: 1)

    transport_mode = TransportMode.create!(name: 'Motocicleta', min_distance: 1, max_distance: 100, min_weight: 0, max_weight: 10, fixed_rate: 6)
    other_transport_mode = TransportMode.create!(name: 'Furgão', min_distance: 10, max_distance: 400, min_weight: 0, max_weight: 650, fixed_rate: 40)

    vehicle = Vehicle.create!(license: 'CDN3312', brand: 'Honda', model: 'CG Cargo', year: '2021', max_load: '20', transport_mode: transport_mode)
    other_vehicle = Vehicle.create!(license: 'ABC1234', brand: 'Fiat', model: 'Fiorino', year: '2020', max_load: '650', transport_mode: other_transport_mode)
    #Act
    login_as(user)
    visit root_path
    click_on 'Veículos'
    click_on 'CDN3312'
    click_on 'Editar'
    fill_in 'Modelo', with: 'CG Cargo HZ'
    fill_in 'Capacidade Máxima de Carga', with: '15'
    click_on 'Cadastrar'
    #Assert
    expect(page).to have_content 'Alteração registrada com sucesso'
    expect(page).to have_content 'Placa: CDN3312'
    expect(page).to have_content 'Modelo: CG Cargo HZ'
    expect(page).to have_content 'Capacidade Máxima de Carga: 15 kg'
  end

  it 'e não altera dados de outro veículo' do
    #Arrange
    user = User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password', role: 1)

    transport_mode = TransportMode.create!(name: 'Motocicleta', min_distance: 1, max_distance: 100, min_weight: 0, max_weight: 10, fixed_rate: 6)
    other_transport_mode = TransportMode.create!(name: 'Furgão', min_distance: 10, max_distance: 400, min_weight: 0, max_weight: 650, fixed_rate: 40)

    vehicle = Vehicle.create!(license: 'CDN3312', brand: 'Honda', model: 'CG Cargo', year: '2021', max_load: '20', transport_mode: transport_mode)
    other_vehicle = Vehicle.create!(license: 'ABC1234', brand: 'Fiat', model: 'Fiorino', year: '2020', max_load: '650', transport_mode: other_transport_mode)
    #Act
    login_as(user)
    visit root_path
    click_on 'Veículos'
    click_on 'CDN3312'
    click_on 'Editar'
    fill_in 'Modelo', with: 'CG Cargo HZ'
    fill_in 'Capacidade Máxima de Carga', with: '15'
    click_on 'Cadastrar'
    click_on 'Voltar'
    click_on 'ABC1234'
    #Assert
    expect(page).to have_content 'Placa: ABC1234'
    expect(page).to have_content 'Marca: Fiat'
    expect(page).to have_content 'Modelo: Fiorino'
    expect(page).to have_content 'Ano de Fabricação: 2020'
    expect(page).to have_content 'Capacidade Máxima de Carga: 650 kg'
  end
end