require 'rails_helper'

describe 'Administrador vê o formulário de cadastro de Tabela de Preços por Peso' do
  it 'com sucesso' do
    user = User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password', role: 1)
    transport_mode = TransportMode.create!(name: 'Motocicleta', min_distance: 1, max_distance: 100, min_weight: 0, max_weight: 10, fixed_rate: 6)

    login_as(user)
    visit root_path
    click_on 'Modalidades de Transporte'
    click_on 'Motocicleta'
    click_on 'Adicionar Tabela de Preços por Peso'
    
    expect(page).to have_content 'Criar Tabela de Preços por Peso'
    expect(page).to have_field 'Peso Inicial'
    expect(page).to have_field 'Peso Final'
    expect(page).to have_field 'Taxa por Kg'
    expect(page).to have_button 'Cadastrar'
  end
end
