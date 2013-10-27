class Item < ActiveRecord::Base
  attr_accessible :name

  validates :name, length: { in: 1..255 }

  belongs_to :list, :inverse_of => :items
end
