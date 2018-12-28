class ProductsController < ApplicationController

	before_action :set_product, except:[:index, :new, :create]
	
	def index
		@products = Product.all
	end

	def show

	end

	def new
		@product = Product.new	
	end

	def create
		@product = current_user.products.new(product_params)
		respond_to do |format|
			if @product.save
				format.html{redirect_to @product, notice: "el producto se creo exitosamente"}
			else
				format.html{render :new, "hubo un error al crear el producto"}
				format.json{render json:@product.errors, status: :unprocessable_entity}
			end
		end
	end

	def edit
		
	end

	def update
		respond_to do |format|
			if @product.update(product_params)
				format.html{redirect_to @product, notice: "se actualizo el producto con exito"}
				format.json{render :show, status: :ok, location: @product}
			else
				format.html{render :new, notice: "error al actualizar el producto"}
				format.json{render json:@product.errors, status: :unprocessable_entity}
			end
		end
	end

	def destroy
		@product.destroy
		respond_to do |format|
			format.html{redirect_to products_url, notice: "producto eliminado con exito"}
			format.json{head :no_content}
		end
	end

	private

		def products_params
			params.require(:product).permit(:name, :description, :pricing)
		end

		def set_product
			@product = Product.find(params[:id])
		end

end