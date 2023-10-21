require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'is valid with valid attributes' do
    group = build(:group)
    expect(group).to be_valid
  end

  it 'is not valid without a user' do
    group = build(:group, user: nil)
    expect(group).to_not be_valid
  end

  it 'is valid without an associated entity' do
    group = build(:group, entity: nil)
    expect(group).to be_valid
  end
end
