class LoginController < ApplicationController
  protect_from_forgery :except => [:login]
  
  def login
    login_user = User.find_by(name:params[:name],pwd:params[:pwd])
    if login_user != nil
      render plain: login_user.token
    else
      render plain: 'no auth'
    end

  end
end
