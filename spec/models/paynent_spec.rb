require 'rails_helper'

RSpec.describe Payment, type: :model do
  user = User.new(name: 'Saied',email: 'saied@gmail.com', password: '123456')
  subject do
    payment = Payment.new(author:user,name:'name',amount:'100')
  end
  before { subject }
  it 'name is nil or blank' do
    test_case = subject
    test_case.name = nil
    expect(test_case).to_not be_valid
    test_case.name = ''
    expect(test_case).to_not be_valid
  end
  it 'name is less than 3 characters or more than 25' do
    test_case = subject
    test_case.name = 'sa' * 26
    expect(test_case).to_not be_valid
  end
  it 'amount not number' do
    test_case = subject
    test_case.amount = 'hey can you detect I am not number?'
    expect(test_case).to_not be_valid
  end
end
