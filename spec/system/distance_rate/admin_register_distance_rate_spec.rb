require 'rails_helper'

describe 'Administrador vê formulário de cadastro de Tabela de Preços por Distância' do
  it 'com sucesso' do
    user = User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password', role: 1)
    transport_mode = TransportMode.create!(name: 'Motocicleta', min_distance: 1, max_distance: 100, min_weight: 0, max_weight: 10, fixed_rate: 6)

    login_as(user)
    visit root_path
    click_on 'Modalidades de Transporte'
    click_on 'Motocicleta'
    click_on 'Adicionar Tabela de Preços por Distância'
    
    expect(page).to have_content 'Criar Tabela de Preços por Distância'
    expect(page).to have_field 'Km Inicial'
    expect(page).to have_field 'Km Final'
    expect(page).to have_field 'Taxa'
    expect(page).to have_button 'Cadastrar'
  end
end

describe 'Administrador cadastra Tabela de Preços por Distância' do
  it 'com sucesso' do
    user = User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password', role: 1)
    transport_mode = TransportMode.create!(name: 'Motocicleta', min_distance: 1, max_distance: 100, min_weight: 0, max_weight: 10, fixed_rate: 6)

    login_as(user)
    visit root_path
    click_on 'Modalidades de Transporte'
    click_on 'Motocicleta'
    click_on 'Adicionar Tabela de Preços por Distância'
    fill_in 'Km Inicial', with: 0
    fill_in 'Km Final', with: 10
    fill_in 'Taxa', with: 5
    click_on 'Cadastrar'
    
    click_on 'Ver Tabela de Preços por Distância'
    
    expect(page).to have_content 'Tabela de Preços por Distância'
    expect(page).to have_content 'Km Inicial'
    expect(page).to have_content 'Km Final'
    expect(page).to have_content 'Número do Registro'
    expect(page).to have_content '10 Km'
    expect(page).to have_content 'R$ 5,00'
  end
end