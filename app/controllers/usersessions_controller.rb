class UsersessionsController < ApplicationController
  def new
    @user = login(params[:email], params[:password])
  end

  def create
    @user = login(params[:email], params[:password])
  
    if @user
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other
  end
end
