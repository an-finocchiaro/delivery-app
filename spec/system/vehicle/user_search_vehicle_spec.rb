require 'rails_helper'

describe 'Usuário busca um veículo' do
  it 'e deve estar autenticado' do
    visit root_path
    expect(page).not_to have_link 'Buscar Veículo'
    expect(page).not_to have_field 'Busca'
    expect(page).not_to have_button 'Buscar'
  end

  it 'pela Placa do Veículo' do
    user = User.create!(name: 'Pedro Matos', email: 'pedro@sistemadefrete.com', password: 'password')
    transport_mode = TransportMode.create!(name: 'Motocicleta', min_distance: 1, max_distance: 100, min_weight: 0, max_weight: 10, fixed_rate: 6)
    other_transport_mode = TransportMode.create!(name: 'Furgão', min_distance: 10, max_distance: 400, min_weight: 0, max_weight: 650, fixed_rate: 40)
    vehicle = Vehicle.create!(license: 'CDN3312', brand: 'Honda', model: 'CG Cargo', year: '2021', max_load: '20', transport_mode: transport_mode)
    other_vehicle = Vehicle.create!(license: 'ABC1234', brand: 'Fiat', model: 'Fiorino', year: '2020', max_load: '650', transport_mode: other_transport_mode)

    login_as(user)
    visit root_path
    click_on 'Buscar Veículo'
    fill_in 'Busca', with: 'ABC1234'
    click_on 'Buscar'

    expect(page).to have_content 'Resultado da Busca'
    expect(page).to have_content 'Modalidade de Transporte: Furgão'
    expect(page).to have_content 'Placa: ABC1234'
    expect(page).to have_content 'Marca: Fiat'
    expect(page).to have_content 'Modelo: Fiorino'
    expect(page).to have_content 'Ano de Fabricação: 2020'
    expect(page).to have_content 'Capacidade Máxima de Carga: 650 kg'
    expect(page).to have_content 'Situação: Disponível'
    expect(page).not_to have_content 'Placa: CDN3312'
    expect(page).not_to have_content 'Marca: Honda'
  end
end