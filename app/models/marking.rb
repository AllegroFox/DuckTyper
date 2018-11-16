class Marking < ApplicationRecord
	# Associations
	has_many :ducks

	# Validations
	validates_presence_of :name
end
