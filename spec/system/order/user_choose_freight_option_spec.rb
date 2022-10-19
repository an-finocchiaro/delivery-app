require 'rails_helper'

describe "Usuário escolhe opção de frete" do
  it "com sucesso" do
    #Arrange

    #----user
    user = User.create!(name: 'Pedro Matos', email: 'pedro@sistemadefrete.com', password: 'password')

    #----order
    order = Order.create!(user: user, pickup_address: 'Rua Alvilândia, 120 ', pickup_zipcode: '05045-000', pickup_city: 'São Paulo', pickup_state: 'SP', product_code: 'ABC-6732', product_dimension: 10, product_weight: 10, recipient_name: 'Maria Moraes', recipient_phone: '(11) 93444-2233', deliver_address: 'Rua do Rocio, 720', delivery_zipcode: '04570-000', delivery_city: 'São Paulo', delivery_state: 'SP', delivery_distance: 20)

    #----transport_modes
    transport_mode = TransportMode.create!(name: 'Bicicleta', min_distance: 1, max_distance: 15, min_weight: 0, max_weight: 6, fixed_rate: 5)
    other_transport_mode = TransportMode.create!(name: 'Motocicleta', min_distance: 1, max_distance: 80, min_weight: 0, max_weight: 11, fixed_rate: 7)
    another_transport_mode = TransportMode.create!(name: 'Furgão', min_distance: 10, max_distance: 300, min_weight: 0, max_weight: 300, fixed_rate: 25)

    #----weight_rates
    weight_rate_for_transport_mode_range_one = WeightRate.create!(transport_mode: transport_mode, min_weight_range: 0, max_weight_range: 2, price_kg: 3)
    weight_rate_for_transport_mode_range_two = WeightRate.create!(transport_mode: transport_mode, min_weight_range: 2, max_weight_range: 4, price_kg: 4)
    weight_rate_for_transport_mode_range_three = WeightRate.create!(transport_mode: transport_mode, min_weight_range: 4, max_weight_range: 6, price_kg: 5)
    
    weight_rate_for_other_transport_mode_range_one = WeightRate.create!(transport_mode: other_transport_mode, min_weight_range: 0, max_weight_range: 2, price_kg: 5)
    weight_rate_for_other_transport_mode_range_two = WeightRate.create!(transport_mode: other_transport_mode, min_weight_range: 2, max_weight_range: 4, price_kg: 6)
    weight_rate_for_other_transport_mode_range_three = WeightRate.create!(transport_mode: other_transport_mode, min_weight_range: 4, max_weight_range: 6, price_kg: 7)
    weight_rate_for_other_transport_mode_range_four = WeightRate.create!(transport_mode: other_transport_mode, min_weight_range: 6, max_weight_range: 8, price_kg: 8)
    weight_rate_for_other_transport_mode_range_five = WeightRate.create!(transport_mode: other_transport_mode, min_weight_range: 8, max_weight_range: 11, price_kg: 9)

    weight_rate_for_another_transport_mode_range_one = WeightRate.create!(transport_mode: another_transport_mode, min_weight_range: 8, max_weight_range: 50, price_kg: 10)
    weight_rate_for_another_transport_mode_range_two = WeightRate.create!(transport_mode: another_transport_mode, min_weight_range: 50, max_weight_range: 100, price_kg: 12)
    weight_rate_for_another_transport_mode_range_three = WeightRate.create!(transport_mode: another_transport_mode, min_weight_range: 100, max_weight_range: 200, price_kg: 15)
    weight_rate_for_another_transport_mode_range_four = WeightRate.create!(transport_mode: another_transport_mode, min_weight_range: 200, max_weight_range: 300, price_kg: 17)

    #----distance_rates
    distance_rate_for_transport_mode_range_one = DistanceRate.create!(transport_mode: transport_mode, min_distance_rate: 1, max_distance_rate: 5, price: 5)
    distance_rate_for_transport_mode_range_two = DistanceRate.create!(transport_mode: transport_mode, min_distance_rate: 5, max_distance_rate: 10, price: 7)
    distance_rate_for_transport_mode_range_three = DistanceRate.create!(transport_mode: transport_mode, min_distance_rate: 10, max_distance_rate: 15, price: 9)

    distance_rate_for_other_transport_mode_range_one = DistanceRate.create!(transport_mode: other_transport_mode, min_distance_rate: 1, max_distance_rate: 40, price: 10)
    distance_rate_for_other_transport_mode_range_two = DistanceRate.create!(transport_mode: other_transport_mode, min_distance_rate: 40, max_distance_rate: 60, price: 14)
    distance_rate_for_other_transport_mode_range_three = DistanceRate.create!(transport_mode: other_transport_mode, min_distance_rate: 60, max_distance_rate: 80, price: 16)

    distance_rate_for_another_transport_mode_range_one = DistanceRate.create!(transport_mode: another_transport_mode, min_distance_rate: 10, max_distance_rate: 100, price: 30)
    distance_rate_for_another_transport_mode_range_two = DistanceRate.create!(transport_mode: another_transport_mode, min_distance_rate: 100, max_distance_rate: 200, price: 40)
    distance_rate_for_another_transport_mode_range_three = DistanceRate.create!(transport_mode: another_transport_mode, min_distance_rate: 200, max_distance_rate: 300, price: 50)

    #----delivery_deadlines
    distance_rate_for_transport_mode_range_one = DeliveryDeadline.create!(transport_mode: transport_mode, min_delivery_distance: 0, max_delivery_distance: 8, deadline: 1)
    distance_rate_for_transport_mode_range_two = DeliveryDeadline.create!(transport_mode: transport_mode, min_delivery_distance: 8, max_delivery_distance: 15, deadline: 2)

    distance_rate_for_other_transport_mode_range_one = DeliveryDeadline.create!(transport_mode: other_transport_mode, min_delivery_distance: 0, max_delivery_distance: 50, deadline: 1)
    distance_rate_for_other_transport_mode_range_two = DeliveryDeadline.create!(transport_mode: other_transport_mode, min_delivery_distance: 50, max_delivery_distance: 80, deadline: 2)

    distance_rate_for_another_transport_mode_range_one = DeliveryDeadline.create!(transport_mode: another_transport_mode, min_delivery_distance: 0, max_delivery_distance: 150, deadline: 2)
    distance_rate_for_another_transport_mode_range_two = DeliveryDeadline.create!(transport_mode: another_transport_mode, min_delivery_distance: 150, max_delivery_distance: 300, deadline: 3)

    login_as(user)
    visit root_path
    click_on 'Ver Ordens de Serviço Pendentes'
    click_on order.code
    click_on 'Iniciar Ordem de Serviço'
    
    expect(page).to have_content "Situação da Ordem de Serviço: Em Andamento"
    expect(page).to have_content order.code
    expect(page).to have_content 'Selecione a opção de frete'
    expect(page).to have_content 'Modalidade de Transporte: Motocicleta'
    expect(page).to have_content 'Preço Total: R$ 107,00'
    expect(page).to have_content 'Modalidade de Transporte: Motocicleta'
    expect(page).to have_content 'Modalidade de Transporte: Furgão'
    expect(page).to have_content 'Preço Total: R$ 155,00'
  end
  
end
