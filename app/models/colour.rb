class Colour < ApplicationRecord
	# Associations
	has_many :ducks

	# Validations
	validates_presence_of :name
	validates_presence_of :hex_colour
end
