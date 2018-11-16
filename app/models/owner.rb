class Owner < ApplicationRecord
	# Associations
	has_many :ducks

	# Validations
	validates_presence_of :name
	validates_presence_of :api_key
end

