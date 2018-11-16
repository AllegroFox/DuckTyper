require 'rails_helper'

# Tests for the Marking model
RSpec.describe Marking, type: :model do
  # Association test
  # ensure Marking model has a 1:m association with the Duck model
  it { should have_many(:ducks) }
  # Validation test
  # ensure name column is present before saving
  it { should validate_presence_of(:name) }
end
