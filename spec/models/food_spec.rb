require 'rails_helper'

RSpec.describe Food, type: :model do

  it 'is valid with valid attributes' do
    food = Food.new(name: 'Apple',measurement_unit: 'g', price: 2)
    expect(food).to be_valid
  end

  it 'validate that has many recipe foods' do
    res = described_class.reflect_on_association(:recipe_foods)
    expect(res.macro).to eq :has_many
  end

  it ' validate that has many inventory foods' do
    res = described_class.reflect_on_association(:inventory_foods)
    expect(res.macro).to eq :has_many
  end
end
