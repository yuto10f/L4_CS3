class TopController < ApplicationController
  def main
    if session[:login_uid] != nil
      render "main"
    else
      render "login"
    end
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user && BCrypt::Password.new(user.pass) == params[:pass]
      session[:login_uid] = params[:uid]
      redirect_to top_main_path
    else
      render "error"
    end
  end
  
  def logout
    session.delete(:login_uid)
    redirect_to top_main_path
  end
  
  def create
    upass = BCrypt::Password.create(params[:pass])
    user = User.new(uid: params[:uid],pass: upass)
    user.save
    redirect_to top_main_path
  end
end
