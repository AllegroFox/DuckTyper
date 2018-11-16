class Duck < ApplicationRecord
	# Associations
	belongs_to :colour
	belongs_to :marking
	belongs_to :owner

	# Validations
	validates_presence_of :name
end
