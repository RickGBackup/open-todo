require 'bcrypt'

class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  private

  def test_password(password, hash)
    BCrypt::Password.new(hash) == password
  end

  def authenticated?
    authenticate_or_request_with_http_basic do |name, password| 
      # check that the inputted pw corresponds to the hashed pw stored for that user
      user = User.find_by(name: name)
      hashed_user_pw = user.password_digest
      test_password(password, hashed_user_pw)
    end
  end
end