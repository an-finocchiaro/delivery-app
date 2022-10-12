require 'rails_helper'

describe 'Usuário administrador cadastra nova modalidade de transporte' do
  it 'com sucesso' do
    #Arrange
    user = User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password', role: 1)
    #Act
    login_as(user)
    visit root_path
    click_on 'Cadastrar Nova Modalidade de Transporte'
    fill_in 'Nome', with: 'Moto'
    fill_in 'Distância Mínima', with: 1
    fill_in 'Distância Máxima', with: 80
    fill_in 'Peso Mínimo', with: 0
    fill_in 'Peso Máximo', with: 10
    fill_in 'Taxa Fixa', with: 6
    click_on 'Cadastrar'
    #Assert
    expect(page).to have_content 'Modalidade de Transporte cadastrada com sucesso'
    expect(page).to have_content 'Modalidade de Transporte: Moto'
    expect(page).to have_content 'Distância Mínima: 1 km'
    expect(page).to have_content 'Distância Máxima: 80 km'
    expect(page).to have_content 'Peso Mínimo: 0 kg'
    expect(page).to have_content 'Peso Máximo: 10 kg'
    expect(page).to have_content 'Taxa Fixa: R$ 6,00'
    expect(page).to have_content 'Status: Ativa'
  end
end