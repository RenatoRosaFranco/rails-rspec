require 'faker'

FactoryBot.define do
  factory :contact do |f|
  	f.firstname { Faker::Name.first_name }
  	f.lastname  { Faker::Name.last_name }
  end
  factory :invalid_contact, parent: :contact do |f|
  	f.firstname nil
  	f.lastname nil
  end
end
