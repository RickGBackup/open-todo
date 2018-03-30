class Api::ItemsController < ApiController
  before_action :authenticated?
 
  def create
    item = Item.new(item_params)
    item.list_id = item_list_id 
    item.user_id = List.find(item_list_id).user_id
  
    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def update
    binding.pry
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end 
  end
    
  private
  def item_list_id
    params.permit(:list_id)[:list_id]
  end
  
  def item_params
    params.require(:item).permit(:name, :completed)
  end
end