require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

	let(:valid_attributes){
		{
			id: 1,
			name: "Producto1",
			user: FactoryGirl.create(:user),
			pricing: 1.0
		}
	}

	let(:invalid_attributes){
		{
			name: "",
			pricing: 0
		}
	}

	describe "GET #index" do 
		it "assigns all products as @products" do 
			product = Product.create! valid_attributes
			get :index, {}
			expect(assigns(:products)).to eq([product])
		end
	end

	describe "GET #show" do
		it "assigns the requested product as @product" do
			product = Product.create! valid_attributes
			get :show, {id: product.to_param}
			expect(assigns(:product)).to eq(product)
		end
	end

	#probar todos los metodos aqui

end
