
FactoryBot.define do 
  factory :owner do
    name { Faker::Name.name }
		api_key { Faker::Number.hexadecimal(24) }
	end	
end