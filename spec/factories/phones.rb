FactoryBot.define do
  factory :phone do
    phone_type 'Home'
    number { Faker::PhoneNumber.phone_number }
    contact nil
  end
end
