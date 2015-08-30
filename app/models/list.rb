class List < ActiveRecord::Base
  validates :list_name, length: { in: 4..255 }
  has_many :items, foreign_key: "list_id", :dependent => :destroy, :inverse_of => :list
end
