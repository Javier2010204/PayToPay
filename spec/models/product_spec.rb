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
