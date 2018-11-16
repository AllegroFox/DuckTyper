require 'rails_helper'

# Tests for the Duck model
RSpec.describe Duck, type: :model do
  # Association test
  # ensure a duck record belongs to a single colour, marking, and owner
  it { should belong_to(:colour) }
  it { should belong_to(:marking) }
  it { should belong_to(:owner) }
  # Validation test
  # ensure name column is present before saving
  it { should validate_presence_of(:name) }
end
