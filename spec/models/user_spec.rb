require 'rails_helper'

RSpec.describe User, type: :model do

  it 'is not confirmed on creation' do
    user = User.create!(name: 'h',email: 'h@gmail.com', password: 'password')
    user.skip_confirmation!
    user.save
    expect(user.name).to eq('h')
  end

  it 'validate that has many recipes' do
    res = described_class.reflect_on_association(:recipes)
    expect(res.macro).to eq :has_many
  end

  it ' validate that has many inventories' do
    res = described_class.reflect_on_association(:inventories)
    expect(res.macro).to eq :has_many
  end

end
