class Category < ActiveRecord::Base
  validates :name, uniqueness: true
  has_and_belongs_to_many(:recipes)
end
