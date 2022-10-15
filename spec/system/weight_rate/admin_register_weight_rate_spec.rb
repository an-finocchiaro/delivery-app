require 'rails_helper'

describe 'Administrador cadastra Tabela de Preços por Peso' do
  it 'com sucesso' do
    user = User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password', role: 1)
    transport_mode = TransportMode.create!(name: 'Motocicleta', min_distance: 1, max_distance: 100, min_weight: 0, max_weight: 10, fixed_rate: 6)

    login_as(user)
    visit root_path
    click_on 'Modalidades de Transporte'
    click_on 'Motocicleta'
    click_on 'Adicionar Tabela de Preços por Peso'
    fill_in 'Peso Inicial', with: 0
    fill_in 'Peso Final', with: 2
    fill_in 'Taxa por Kg', with: 3
    click_on 'Cadastrar'
    click_on 'Ver Tabela de Preços por Peso'
    
    expect(page).to have_content 'Tabela de Preços por Peso'
    expect(page).to have_content 'Peso Inicial'
    expect(page).to have_content 'Número do Registro'
    expect(page).to have_content '2 kg'
    expect(page).to have_content 'R$ 3,00/Kg'
  end
end
