require 'rails_helper'

describe 'Administrador cadastra Tabela de Prazos de Entrega' do
  it 'com sucesso' do
    user = User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password', role: 1)
    transport_mode = TransportMode.create!(name: 'Motocicleta', min_distance: 1, max_distance: 100, min_weight: 0, max_weight: 10, fixed_rate: 6)

    login_as(user)
    visit root_path
    click_on 'Modalidades de Transporte'
    click_on 'Motocicleta'
    click_on 'Adicionar Tabela de Prazos de Entrega'
    fill_in 'Distância Inicial', with: 1
    fill_in 'Distância Final', with: 120
    fill_in 'Prazo de Entrega', with: 24
    click_on 'Cadastrar'
    click_on 'Ver Tabela de Prazos de Entrega'
    
    expect(page).to have_content 'Tabela de Prazos de Entrega'
    expect(page).to have_content 'Distância Inicial'
    expect(page).to have_content 'Distância Final'
    expect(page).to have_content 'Prazo de Entrega'
    expect(page).to have_content '120 Km'
    expect(page).to have_content '24 horas'
  end
end
