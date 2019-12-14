class Api::V1::ProductsController < Api::V1::BaseController
  before_action :authenticate_api_user

  def create
    @product = Product.new(product_params)
    
    if @product.save
      success_response(@product)
    else
      error_response(@product.errors.full_messages.to_a)
    end    
  end

  private
  
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
  
end
