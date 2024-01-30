class InventoryFood < ApplicationRecord
  belongs_to :food, class_name: 'Food'
  belongs_to :inventory, class_name: 'Inventory'
end
