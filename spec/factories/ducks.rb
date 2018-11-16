
FactoryBot.define do 
  factory :duck do
    name { Faker::Name.first_name }
    colour_id { Colour.ids.sample }
    marking_id { Marking.ids.sample }
    owner_id { Owner.ids.sample }	
  end  
end