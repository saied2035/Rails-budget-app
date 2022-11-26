require 'rails_helper'

RSpec.describe 'catagories#new', type: :feature do
  before :each do
    @user = User.create(name: 'Saied', email: 'saied3@gmail.com', password: '123456')
    login_as(@user)
    visit new_catagory_path
  end

  it 'get new transaction page with logged in user' do
    expect(page).to have_content 'Add Category'
  end

  it 'add empty inputs' do
    click_button 'Save'
    expect(page).to have_content "Name can't be blank"
  end
  it 'add proper inputs' do
    fill_in 'catagory[name]', with: 'new category'
    fill_in 'catagory[icon]', with: 'new category icon'
    click_button 'Save'
    expect(page).to have_content 'Category has been created successfully.'
  end
end
