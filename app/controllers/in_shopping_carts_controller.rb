class InShoppingCartsController < ApplicationController

    def create
        in_shopping_cart = InShoppingCart.new(product_id: params[:product_id], shopping_cart: @shopping_carts)
        
        if in_shopping_cart.save
            redirect_to carrito_path, notice: "Guardamos el producto en el carrito" 
        else
            redirect_to product_path(id: params[:product_id]), notice: "No pudimos agregar al carrito"
        end
    
            
    end

    def destroy
        @in_shopping_cart = InShoppingCart.find(params[:id])
        @in_shopping_cart.destroy
        redirect_to carrito_path
    end
    
    
end
