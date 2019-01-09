require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

	let(:valid_attributes){
		{
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

	#probar todos los metodos aqui

end
