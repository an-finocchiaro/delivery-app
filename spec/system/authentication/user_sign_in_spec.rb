require 'rails_helper'

describe 'Usuário se registra' do
  it 'com sucesso' do
    #Arrange
    #Act
    visit root_path
    click_on 'Registre-se'
    fill_in 'Nome', with: 'Ana Costa'
    fill_in 'E-mail', with: 'ana@sistemadefrete.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Registre-se'
    #Assert
    expect(page).to have_content 'Você realizou seu registro com sucesso'
    expect(page).not_to have_link 'Entrar'
    expect(page).to have_button 'Sair'
    expect(page).to have_content 'Usuário: Ana Costa'
    expect(page).to have_content 'ana@sistemadefrete.com'
  end

  it 'e o email deve ser único' do
    #Arrange
    User.create!(name: 'Ana Machado', email: 'ana@sistemadefrete.com', password: 'password')
    #Act
    visit root_path
    click_on 'Registre-se'
    fill_in 'Nome', with: 'Ana Costa'
    fill_in 'E-mail', with: 'ana@sistemadefrete.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Registre-se'
    #Assert
    expect(page).to have_content 'Não foi possível salvar usuário'
    expect(page).to have_content 'E-mail já está em uso'
    expect(page).to have_link 'Entrar'
    expect(page).not_to have_button 'Sair'
    expect(page).not_to have_content 'Usuário: Ana Costa'
    expect(page).not_to have_content 'ana@sistemadefrete.com'
  end
end

describe 'Usuário acessa o sistema' do
  it 'com sucesso' do
    #Arrange
    User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password')
    #Act
    visit root_path
    fill_in 'E-mail', with: 'ana@sistemadefrete.com'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'
    #Assert
    expect(page).to have_content 'Login efetuado com sucesso'
    expect(page).not_to have_link 'Entrar'
    expect(page).to have_button 'Sair'
    expect(page).to have_content 'Usuário: Ana Costa'
    expect(page).to have_content 'ana@sistemadefrete.com'
  end

  it 'e não vê itens restritos a administrador' do
    #Arrange
    User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password', role: 0)
    #Act
    visit root_path
    fill_in 'E-mail', with: 'ana@sistemadefrete.com'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'
    #Assert
    expect(page).to have_content 'Login efetuado com sucesso'
    expect(page).to have_content 'Usuário: Ana Costa'
    expect(page).to have_content 'ana@sistemadefrete.com'
    expect(page).to have_content 'Área de Usuários'
    expect(page).not_to have_content 'Área Restrita a Administradores'
  end

  it 'e faz logout' do
    #Arrange
    User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password')
    #Act
    visit root_path
    fill_in 'E-mail', with: 'ana@sistemadefrete.com'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'
    click_on 'Sair'
    #Assert
    expect(page).to have_content 'Para continuar, faça login ou registre-se'
    expect(page).to have_button 'Entrar'
    expect(page).not_to have_content 'Usuário: Ana Costa'
    expect(page).not_to have_content 'ana@sistemadefrete.com'
  end
end

describe 'Administrador acessa o sistema' do
  it 'e vê itens de área excluviva' do
    #Arrange
    User.create!(name: 'Ana Costa', email: 'ana@sistemadefrete.com', password: 'password', role: 1)
    #Act
    visit root_path
    fill_in 'E-mail', with: 'ana@sistemadefrete.com'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'
    #Assert
    expect(page).to have_content 'Usuário: Ana Costa'
    expect(page).to have_content 'ana@sistemadefrete.com'
    expect(page).to have_content 'Área Restrita a Administradores'
    expect(page).not_to have_content 'Área de Usuários'
  end
end
