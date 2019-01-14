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

require 'rails_helper'

RSpec.describe Product, type: :model do
  
	it{ should validates_presence_of :name}
	it{ should validates_presence_of :user}
	it{ should validates_presence_of :pricing}

	it "should validate pricing > 0" do
		product = FactoryGirl.build(:product, pricing: 0)
		#puts product.inspect
		puts product.errors.inspect
		expect(product.valid?).to be_falsy
	end

end
