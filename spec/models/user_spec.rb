require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Saied',email: 'saied@gmail.com', password: '123456')
  end
  before { subject }
  it 'name is nil or blank' do
    test_case = subject
    test_case.name = nil
    expect(test_case).to_not be_valid
    test_case.name = ''
    expect(test_case).to_not be_valid
  end
end
