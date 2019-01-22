# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  name                :string
#  description         :text
#  pricing             :decimal(10, 2)
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :bigint
#  avatar_updated_at   :datetime
#  user_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Product < ApplicationRecord
  belongs_to :user
  has_many :attachments
  has_many :in_shopping_carts
  has_many :shopping_carts, through: :in_shopping_carts


  validates_presence_of :name, :pricing, :user
  validates :pricing, numericality: { greater_than: 0}

  has_attached_file :avatar, styles:{medium: "300x300", thumb:"100x100"}, default_url: "missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  

end
