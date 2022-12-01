require 'rails_helper'

RSpec.describe 'catagories#index', type: :feature do
  before :each do
    @user = User.new(name: 'Saied', email: 'saied3@gmail.com', password: '123456')
  end
  it 'get root without login' do
    visit authenticated_root_path
    expect(page).to have_content 'Budget Calculator'
  end
  it 'get root with logged in user' do
    @user.save
    login_as(@user)
    visit root_path
    expect(page).to have_content 'Total categories amount'
  end
  it 'add catagories' do
    @user.save
    login_as(@user)
    catagory = Catagory.new(author: @user, name: 'games', icon: 'game icon')
    catagory.save
    visit root_path
    expect(page).to have_content 'games'
  end
  it 'go to category' do
    @user.save
    login_as(@user)
    catagory = Catagory.new(author: @user, name: 'games', icon: 'game icon')
    catagory.save
    visit root_path
    click_link 'games'
    expect(page).to have_content 'Total transactions amount'
  end

  it 'go to new catagory' do
    @user.save
    login_as(@user)
    visit root_path
    click_link 'New category'
    expect(page).to have_content 'Add Category'
  end
end
