require 'rails_helper'

describe 'Administrador cadastra nova Ordem de Serviço' do

  it 'e deve estar autenticado' do
    visit root_path

    expect(page).to have_content 'faça login ou registre-se'
    expect(page).not_to have_link 'Cadastrar Ordem de Serviço'
    expect(current_path).to eq new_user_session_path
  end

  it 'com sucesso' do
    user = User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password', role: 1)
    allow(SecureRandom).to receive(:alphanumeric).and_return('ABCDE0123456789')

    login_as(user)
    visit root_path
    click_on 'Cadastrar Ordem de Serviço'
    find('div#pickup').fill_in('Endereço (Retirada)', with: 'Rua do Carmo, 312')
    find('div#pickup').fill_in('CEP (Retirada)', with: '05501-030')
    find('div#pickup').fill_in('Cidade (Retirada)', with: 'São Paulo')
    find('div#pickup').fill_in('Estado (Retirada)', with: 'SP')
    find('div#product').fill_in('Código do Produto', with: 'MAGALU-FGU057230')
    find('div#product').fill_in('Dimensões do Produto', with: 30)
    find('div#product').fill_in('Peso do Produto', with: 120)
    find('div#recipient').fill_in('Nome do Destinatário', with: 'Eduardo Cortes')
    find('div#recipient').fill_in('Telefone para Contato', with: '(11) 98542-1313')
    find('div#recipient').fill_in('Endereço (Entrega)', with: 'Rua Marjolene, 742')
    find('div#recipient').fill_in('CEP (Entrega)', with: '02412-130')
    find('div#recipient').fill_in('Cidade (Entrega)', with: 'São Paulo')
    find('div#recipient').fill_in('Estado (Entrega)', with: 'SP')
    find('div#recipient').fill_in('Distância Total', with: 42)
    click_on 'Cadastrar'

    expect(page).to have_content 'Ordem de Serviço: ABCDE0123456789'
    expect(page).to have_content 'Dados de Retirada'
    expect(page).to have_content 'Endereço: Rua do Carmo, 312'
    expect(page).to have_content 'Código do Produto: MAGALU-FGU057230'
    expect(page).to have_content 'Dimensões do Produto: 30 m3'
    expect(page).to have_content 'Peso do Produto: 120 kg'
    expect(page).to have_content 'Destinatário: Eduardo Cortes'
    expect(page).to have_content 'Endereço: Rua Marjolene, 742'
    expect(page).to have_content 'CEP: 02412-130'
  end
end