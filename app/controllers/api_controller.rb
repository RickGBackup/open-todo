require 'bcrypt'

class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  private

  def test_password(password, hash)
    BCrypt::Password.new(hash) == password
  end
  
  def resource
    # This grabs the resource from the controller params - e.g. List, User, etc.
    params[:controller].split("/")[1].singularize.capitalize.constantize
  end
  
  def authenticated?
    authenticate_or_request_with_http_basic do |name, password| 
      current_user = User.find_by(name: name)  # grab user making the request
      
      # if params contain :user_id, use that, otherwise grab it from the ID of 
      # the particular resource (List, Item), depending on what's in params[:controller].
      if params[:user_id]
        user = User.find(params[:user_id])
      else
        user = User.find(resource.find(params[:id]).user_id) # grab user whose data is being requested
      end
      binding.pry
      hashed_user_pw = current_user.password_digest
      
      # for update or destroy actions, authenticate if valid pw in request, and user is trying to edit their own data
      # for other actions, authenticate if valid pw in request.
      if params[:action] == ("update" || "destroy")
        test_password(password, hashed_user_pw) && current_user == user
      else
        test_password(password, hashed_user_pw)
      end 
    end
    rescue
      render json: { error: "You are unauthorized" }, status: 401
  end
end