class Product < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :pricing, :user

  validates :pricing, numericality: { greater_than: 0}
end
