require 'rails_helper'

RSpec.describe 'payments#new', type: :feature do
  before :each do
    @user = User.create(name: 'Saied', email: 'saied3@gmail.com', password: '123456')
    @catagory = Catagory.create(author: @user, name: 'games', icon: 'game icon')
    login_as(@user)
    visit new_catagory_payment_path(@catagory)
  end

  it 'get new transaction page with logged in user' do
    expect(page).to have_content 'Add existing transaction'
  end

  it 'add empty inputs' do
    button = find('#submit-new')
    button.click
    expect(page).to have_content "Name can't be blank"
  end
  it 'add proper inputs' do
    fill_in 'payment[name]', with: 'game 2'
    fill_in 'payment[amount]', with: '50'
    button = find('#submit-new')
    button.click
    expect(page).to have_content 'Transaction has been created successfully.'
  end
  it 'add existing payment to category' do
    fill_in 'payment[name]', with: 'game 2'
    fill_in 'payment[amount]', with: '50'
    button = find('#submit-new')
    button.click

    new_catagory = Catagory.create(author: @user, name: 'streaming', icon: 'stream icon')
    visit new_catagory_payment_path(new_catagory)
    find('#payment_id').find(:xpath, 'option[1]').select_option
    expect(page).to have_content 'game 2'
  end
end
