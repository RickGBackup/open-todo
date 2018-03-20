class Api::ListsController < ApiController
  before_action :authenticated?
  
 def create
    list = List.new(list_params)
    list.user_id = list_user_id
    
    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  private
  def list_user_id
    params.permit(:user_id)[:user_id]
  end
  
  def list_params
    params.require(:list).permit(:title)
  end
end