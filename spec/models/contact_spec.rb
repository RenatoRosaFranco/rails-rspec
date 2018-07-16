require 'rails_helper'

RSpec.describe Contact, type: :model do
  	it "has a valid factory" do 
  		expect(FactoryBot.build(:contact)).to be_valid
  	end 
  	it "is invalid without a firstname" do 
  		expect(FactoryBot.build(:contact, {firstname: nil})).to be_invalid
  	end
  	it "is invalid without a lastname" do  
  		expect(FactoryBot.build(:contact, {lastname: nil})).to be_invalid
  	end
  	it "returns a contact's full name as a string" do 
  		expect(FactoryBot.build(:contact).full_name).to be_a(String)		
  	end
  	it "have many phones" do 
  		expect(FactoryBot.build(:contact)).to have_many(:phones)
  	end
end
