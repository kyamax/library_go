FactoryBot.define do
  factory :admin do
    id { Faker::Number.number(digits: 2) }
    name { Faker::Name.last_name }
    employee_id { Faker::Number.number(digits: 8) }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
