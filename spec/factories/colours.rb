
FactoryBot.define do 
  factory :colour do
    name { Faker::Color.color_name }
    hex_colour { Faker::Color.hex_color }
  end 
end