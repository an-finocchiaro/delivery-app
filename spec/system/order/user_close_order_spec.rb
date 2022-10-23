require 'rails_helper'

describe "Usuário encerra Ordem de Serviço" do
  it "com sucesso" do
    #Arrange

    #----users
    admin_user = User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password', role: 1)
    user = User.create!(name: 'Pedro Matos', email: 'pedro@sistemadefrete.com', password: 'password')

    #----transport_mode
    transport_mode = TransportMode.create!(name: 'Motocicleta', min_distance: 1, max_distance: 80, min_weight: 0, max_weight: 11, fixed_rate: 7)

     #----vehicle
    vehicle = Vehicle.create!(license: 'CDN3312', brand: 'Honda', model: 'CG Cargo', year: '2021', max_load: '20', transport_mode: transport_mode)

    #----order
    order = Order.create!(user: admin_user, pickup_address: 'Rua Alvilândia, 120 ', pickup_zipcode: '05045-000', pickup_city: 'São Paulo', pickup_state: 'SP', product_code: 'ABC-6732', product_dimension: 10, product_weight: 10, recipient_name: 'Maria Moraes', recipient_phone: '(11) 93444-2233', deliver_address: 'Rua do Rocio, 720', delivery_zipcode: '04570-000', delivery_city: 'São Paulo', delivery_state: 'SP', delivery_distance: 20, status: 2, order_final_price: 107, order_final_deadline: 1, order_run_date: Date.today, order_final_vehicle: vehicle.license)

    login_as(user)
    visit root_path
    click_on 'Ver Ordens de Serviço'
    click_on order.code
    click_on 'Encerrar Ordem de Serviço'
    fill_in 'Data de Encerramento', with: Date.today
    select 'Em Atraso', from: 'Situação Final da Entrega'
    fill_in 'Justificativa', with: 'Problemas na retirada do produto, produto indisponível na data agendada'
    click_on 'Salvar'

    expect(page).to have_content 'Situação da Ordem de Serviço: Encerrada'
    expect(page).to have_content "Data de Encerramento: #{Date.today}"
    expect(page).to have_content 'Situação Final da Entrega: Em Atraso'
    expect(page).to have_content 'Justificativa: Problemas na retirada do produto, produto indisponível na data agendada'
  end
end
