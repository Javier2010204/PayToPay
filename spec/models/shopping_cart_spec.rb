require 'rails_helper'

RSpec.describe ShoppingCart, type: :model do
  describe "status" do 
    it "can be set as payed" do 
      shopping_cart = FactoryGirl.create(:shopping_cart)
      shopping_cart.payed!
      puts shopping_cart.status
      expect(shopping_cart.status).to eq("payed")
    end
  end
end
