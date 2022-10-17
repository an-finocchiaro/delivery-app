require 'rails_helper'

describe 'Usuário vê formulário para iniciar uma ordem de serviço' do
  it 'com sucesso' do
    user = User.create!(name: 'Pedro Matos', email: 'pedro@sistemadefrete.com', password: 'password')
    order = Order.create!(user: user, pickup_address: 'Rua Alvilândia, 120 ', pickup_zipcode: '05045-000', pickup_city: 'São Paulo', pickup_state: 'SP', product_code: 'ABC-6732', product_dimension: 10, product_weight: 11, recipient_name: 'Maria Moraes', recipient_phone: '(11) 93444-2233', deliver_address: 'Rua do Rocio, 720', delivery_zipcode: '04570-000', delivery_city: 'São Paulo', delivery_state: 'SP', delivery_distance: 20)

    login_as(user)
    visit root_path
    click_on 'Ver Ordens de Serviço Pendentes'
    click_on order.code
    click_on 'Iniciar Ordem de Serviço'

    expect(page).to have_content "Ordem de Serviço Iniciada: #{order.code}"
    expect(page).to have_ 
  end
end