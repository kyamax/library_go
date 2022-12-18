FactoryBot.define do
  factory :user do
    id { Faker::Number.number(digits: 2) }
    name { Faker::Name.last_name }
    grade_id { Faker::Number.between(from: 2, to: 7) }
    class_num_id { Faker::Number.between(from: 2, to: 8) }
    number_id { Faker::Number.between(from: 2, to: 41) }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
