require 'rails_helper'

RSpec.feature "catagories#show", type: :feature do
  before :each do
    @user = User.create(name: 'Saied', email: 'saied3@gmail.com', password: '123456')
    @catagory = Catagory.create(author:@user,name:'games',icon:'game icon')
    login_as(@user)
  end  

  it "get transactions with logged in user" do
   visit catagory_path(@catagory) 
   expect(page).to have_content 'Total transactions amount'
  end
  it "add transactions" do
   payment = Payment.new(author:@user,name:'game',amount:100)
   payment.save 
   @catagory.payments << payment
   visit catagory_path(@catagory)
   expect(page).to have_content 'game'
   expect(page).to have_content 'Total transactions amount $100.0'
   visit root_path
   expect(page).to have_content 'Total categories amount $100.0'
  end
  it "go to new transaction" do
   @user.save
   login_as(@user)
   visit catagory_path(@catagory)
   click_link "New transaction"
   expect(page).to have_content 'Add existing transaction'
  end
end
