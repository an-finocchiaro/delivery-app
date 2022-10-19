# README

ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [x86_64-linux]
Rails 7.0.4

instalação com --minimal --skip-test

gems adicionadas:
gem "rspec-rails"
gem "capybara"
gem "devise"
gem "bootstrap"

Para popular o banco de dados com o arquivo seeds execute no terminal o comando: db:seed
Para executar os testes execute no terminal o comando: rspec

funcionalidades faltando:

1 reservar veiculo, registrar novos dados na OS, apagar formulário de consulta
2 encerrar ordem, calcular atraso? registrar novos dados
3 busca por OS sem login

link Trello
https://trello.com/invite/b/CrMktbd1/f3249ef42ea90b6d659b69b924978b68/sistema-de-frete


Aplicação responsável por gerenciar a frota de entrega para um e-commerce com alcance nacional. Diferentes tipos de transporte são cadastrados definindo os prazos e os custos. A plataforma deve cadastrar novos pedidos de frete (ordens de serviço) e fazer os cálculos de frete de acordo com os tipos de transporte que atendem ao perfil do pedido. Além disso deve ser possível controlar as ordens de serviço em andamento, encerrar ordens de serviço e consultar o status da frota de veículos da empresa.


