# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#----user
user = User.create!(name: 'Pedro Matos', email: 'pedro@sistemadefrete.com', password: 'password')
admin_user = User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password', role: 1)

#----order
order = Order.create!(user: admin_user, pickup_address: 'Rua Alvilândia, 120 ', pickup_zipcode: '05045-000', pickup_city: 'São Paulo', pickup_state: 'SP', product_code: 'ABC-6732', product_dimension: 10, product_weight: 10, recipient_name: 'Maria Moraes', recipient_phone: '(11) 93444-2233', deliver_address: 'Rua do Rocio, 720', delivery_zipcode: '04570-000', delivery_city: 'São Paulo', delivery_state: 'SP', delivery_distance: 20)
other_order = Order.create!(user: admin_user, pickup_address: 'Rua Madressilva, 45 ', pickup_zipcode: '01315-000', pickup_city: 'São Paulo', pickup_state: 'SP', product_code: 'UXI-3333', product_dimension: 5, product_weight: 8, recipient_name: 'Antonio Oliveira', recipient_phone: '(11) 97878-2315', deliver_address: 'Rua Pintassilgo, 88', delivery_zipcode: '03512-000', delivery_city: 'São Paulo', delivery_state: 'SP', delivery_distance: 15)
another_order = Order.create!(user: admin_user, pickup_address: 'Rua Brasilia, 345 ', pickup_zipcode: '04555-000', pickup_city: 'São Paulo', pickup_state: 'SP', product_code: 'LLL-1313', product_dimension: 7, product_weight: 6, recipient_name: 'Amanda Cortes', recipient_phone: '(11) 95434-1313', deliver_address: 'Rua Luis Pimentel, 800', delivery_zipcode: '03813-000', delivery_city: 'São Paulo', delivery_state: 'SP', delivery_distance: 16)

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

#----vehicles
vehicle = Vehicle.create!(license: 'ZIA4437', brand: 'Ford', model: 'Cargo 816', year: '2019', max_load: '7000', transport_mode: another_transport_mode)
other_vehicle = Vehicle.create!(license: 'CDN3312', brand: 'Honda', model: 'CG Cargo', year: '2021', max_load: '20', transport_mode: other_transport_mode)
another_vehicle = Vehicle.create!(license: 'ABC1234', brand: 'Fiat', model: 'Fiorino', year: '2020', max_load: '650', transport_mode: another_transport_mode)