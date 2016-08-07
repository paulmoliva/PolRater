class UserSessionsController < ApplicationController
  def new
  end

  def create
    params[:email].downcase!
    if login(params[:email], params[:password])
      redirect_back_or_to(root_path, notice: 'Logged in successfully.')
    else
      redirect_to(:root, notice: 'Login Failed!')
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: 'Logged out!')
  end
end
