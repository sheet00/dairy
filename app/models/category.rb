class Category < ActiveRecord::Base
  self.primary_key = :id
  validates :id, :no, :name, presence: true
  validates_uniqueness_of :id, :no
end
