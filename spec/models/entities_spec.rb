# entity_spec.rb
require 'rails_helper'

RSpec.describe Entity, type: :model do
  it 'is valid with valid attributes' do
    entity = build(:entity)
    expect(entity).to be_valid
  end

  it 'is not valid without a name' do
    entity = build(:entity, name: nil)
    expect(entity).not_to be_valid
  end
end
