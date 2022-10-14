require 'rails_helper'

describe 'Administrador cadastra novo veículo' do
  it 'com sucesso' do
    #Arrange
    user = User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password', role: 1)
    transport_mode = TransportMode.create!(name: 'Motocicleta', min_distance: 1, max_distance: 100, min_weight: 0, max_weight: 10, fixed_rate: 6)
    other_transport_mode = TransportMode.create!(name: 'Furgão', min_distance: 10, max_distance: 400, min_weight: 0, max_weight: 650, fixed_rate: 40)
    #Act
    login_as(user)
    visit root_path
    click_on 'Veículos'
    click_on 'Cadastrar Novo Veículo'
    fill_in 'Placa',	with: 'CDN3312'
    fill_in 'Marca', with: 'Honda'
    fill_in 'Modelo', with: 'CG Cargo'
    fill_in 'Ano de Fabricação', with: '2021'
    fill_in 'Capacidade Máxima de Carga', with: '20'
    select 'Motocicleta', from: 'Modalidade de Transporte'
    click_on 'Cadastrar'
    #Assert
    expect(page).to have_content 'Veículo cadastrado com sucesso'
    expect(page).to have_content 'Informações do Veículo'
    expect(page).to have_content 'Modalidade de Transporte: Motocicleta'
    expect(page).to have_content 'Placa: CDN3312'
    expect(page).to have_content 'Marca: Honda'
    expect(page).to have_content 'Modelo: CG Cargo'
    expect(page).to have_content 'Ano de Fabricação: 2021'
    expect(page).to have_content 'Capacidade Máxima de Carga: 20 kg'
  end

  it 'e a situação padrão do veículo é Disponível' do
    #Arrange
    user = User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password', role: 1)
    transport_mode = TransportMode.create!(name: 'Motocicleta', min_distance: 1, max_distance: 100, min_weight: 0, max_weight: 10, fixed_rate: 6)
    other_transport_mode = TransportMode.create!(name: 'Furgão', min_distance: 10, max_distance: 400, min_weight: 0, max_weight: 650, fixed_rate: 40)
    #Act
    login_as(user)
    visit root_path
    click_on 'Veículos'
    click_on 'Cadastrar Novo Veículo'
    fill_in 'Placa',	with: 'CDN3312'
    fill_in 'Marca', with: 'Honda'
    fill_in 'Modelo', with: 'CG Cargo'
    fill_in 'Ano de Fabricação', with: '2021'
    fill_in 'Capacidade Máxima de Carga', with: '20'
    select 'Motocicleta', from: 'Modalidade de Transporte'
    click_on 'Cadastrar'
    #Assert
    expect(page).to have_content 'Veículo cadastrado com sucesso'
    expect(page).to have_content 'Placa: CDN3312'
    expect(page).to have_content 'Situação: Disponível'
  end
end