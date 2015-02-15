class Weather < ActiveRecord::Base
  has_one :diary

  validates :file_name, :name, presence: true
  validates_uniqueness_of :file_name
end
