require 'rails_helper'

describe 'Administrador edita Modalidade de Transporte' do
  it 'com sucesso' do
    user = User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password', role: 1)
    transport_mode = TransportMode.create!(name: 'Bicicleta', min_distance: 1, max_distance: 15, min_weight: 0, max_weight: 6, fixed_rate: 5)
    other_transport_mode = TransportMode.create!(name: 'Motocicleta', min_distance: 1, max_distance: 80, min_weight: 0, max_weight: 11, fixed_rate: 6)
    #Act
    login_as(user)
    visit root_path
    click_on 'Modalidades de Transporte'
    click_on 'Bicicleta'
    click_on 'Editar'
    fill_in 'Nome', with: 'Bicicleta Elétrica'
    fill_in 'Distância Máxima', with: 30
    fill_in 'Taxa Fixa', with: 7
    click_on 'Cadastrar'
    #Assert
    expect(page).to have_content 'Alteração registrada com sucesso'
    expect(page).to have_content 'Modalidade de Transporte: Bicicleta Elétrica'
    expect(page).to have_content 'Distância Máxima: 30 km'
    expect(page).to have_content 'Taxa Fixa: R$ 7,00'
  end

  it 'e não altera dados de outra Modalidade' do
    user = User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password', role: 1)
    transport_mode = TransportMode.create!(name: 'Bicicleta', min_distance: 1, max_distance: 15, min_weight: 0, max_weight: 6, fixed_rate: 5)
    other_transport_mode = TransportMode.create!(name: 'Motocicleta', min_distance: 1, max_distance: 80, min_weight: 0, max_weight: 11, fixed_rate: 6)
    #Act
    login_as(user)
    visit root_path
    click_on 'Modalidades de Transporte'
    click_on 'Bicicleta'
    click_on 'Editar'
    fill_in 'Nome', with: 'Bicicleta Elétrica'
    fill_in 'Distância Máxima', with: 30
    fill_in 'Taxa Fixa', with: 7
    click_on 'Cadastrar'
    click_on 'Voltar'
    click_on 'Motocicleta'
    #Assert
    expect(page).to have_content 'Modalidade de Transporte: Motocicleta'
    expect(page).to have_content 'Distância Máxima: 80 km'
    expect(page).to have_content 'Peso Máximo: 11 kg'
    expect(page).to have_content 'Taxa Fixa: R$ 6,00'
  end
end