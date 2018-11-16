require 'rails_helper'

# Tests for the Colour model
RSpec.describe Colour, type: :model do
  # Association test
  # ensure Colour model has a 1:m association with the Duck model
  it { should have_many(:ducks) }
  # Validation test
  # ensure name column is present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:hex_colour) }
end
