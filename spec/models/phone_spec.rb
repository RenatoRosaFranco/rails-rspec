require 'rails_helper'

RSpec.describe Phone, type: :model do
  it 'has a valid factory' do 
 		contact = FactoryBot.build(:contact)
 		expect(FactoryBot.build(:phone, contact: contact)).to be_valid
  end
  it 'is invalid withou a phone type' do 
  	expect(FactoryBot.build(:phone, {phone_type: nil})).to be_invalid
  end
  it 'is invalid without a phone number' do 
  	expect(FactoryBot.build(:phone, {number: nil})).to be_invalid
  end
  it 'belongs to a contact' do 
  	expect(FactoryBot.build(:phone)).to belong_to(:contact)
  end
end
