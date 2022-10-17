require 'rails_helper'

describe 'Usuário vê índice de Ordens de Serviço Pendentes' do
  it 'com sucesso' do
    user = User.create!(name: 'Pedro Matos', email: 'pedro@sistemadefrete.com', password: 'password')
    order = Order.create!(user: user, pickup_address: 'Rua Alvilândia, 120 ', pickup_zipcode: '05045-000', pickup_city: 'São Paulo', pickup_state: 'SP', product_code: 'ABC-6732', product_dimension: 10, product_weight: 11, recipient_name: 'Maria Moraes', recipient_phone: '(11) 93444-2233', deliver_address: 'Rua do Rocio, 720', delivery_zipcode: '04570-000', delivery_city: 'São Paulo', delivery_state: 'SP', delivery_distance: 20)
    other_order = Order.create!(user: user, pickup_address: 'Rua Barra Funda, 400 ', pickup_zipcode: '03215-000', pickup_city: 'São Paulo', pickup_state: 'SP', product_code: 'XVZ-1234', product_dimension: 5, product_weight: 4, recipient_name: 'José Abreu', recipient_phone: '(11) 99812-3312', deliver_address: 'Rua Carmem, 300', delivery_zipcode: '04574-000', delivery_city: 'São Paulo', delivery_state: 'SP', delivery_distance: 12)

    login_as(user)
    visit root_path
    click_on 'Ver Ordens de Serviço Pendentes'
    
    expect(page).to have_content 'Nome do Destinatário: Maria Moraes'
    expect(page).to have_content 'Nome do Destinatário: José Abreu'
    expect(page).to have_content 'Telefone para Contato: (11) 93444-2233'
    expect(page).to have_content 'Telefone para Contato: (11) 99812-3312'
    expect(page).to have_content 'Situação da Ordem de Serviço: Pendente'
  end

  it 'e vê detalhes da Ordem de Serviço' do
    user = User.create!(name: 'Pedro Matos', email: 'pedro@sistemadefrete.com', password: 'password')
    order = Order.create!(user: user, pickup_address: 'Rua Alvilândia, 120 ', pickup_zipcode: '05045-000', pickup_city: 'São Paulo', pickup_state: 'SP', product_code: 'ABC-6732', product_dimension: 10, product_weight: 11, recipient_name: 'Maria Moraes', recipient_phone: '(11) 93444-2233', deliver_address: 'Rua do Rocio, 720', delivery_zipcode: '04570-000', delivery_city: 'São Paulo', delivery_state: 'SP', delivery_distance: 20)
    
    login_as(user)
    visit root_path
    click_on 'Ver Ordens de Serviço Pendentes'
    click_on order.code

    expect(page).to have_content "Ordem de Serviço: #{order.code}"
    expect(page).to have_content 'Endereço: Rua Alvilândia, 120'
    expect(page).to have_content 'Código do Produto: ABC-6732'
    expect(page).to have_content 'Dimensões do Produto: 10 m3'
    expect(page).to have_content 'Peso do Produto: 11 kg'
    expect(page).to have_content 'Distância Total: 20 km'
  end
end