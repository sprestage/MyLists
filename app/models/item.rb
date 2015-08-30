class Item < ActiveRecord::Base
  validates :name, length: { in: 1..255 }

  belongs_to :list, :inverse_of => :items
end
