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
  
  def destroy
    begin 
      list = List.find(params[:id])
      list.destroy
      
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end
  
  def update
    # grab the list ID from the html passed in curl request
    list = List.find(params[:id])
    # update list using the new title data
    if list.update(list_params)
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
    params.require(:list).permit(:title, :private)
  end
end