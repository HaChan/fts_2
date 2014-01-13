class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by email: params[:session][:email].downcase
    if admin && admin.authenticate(params[:session][:password])
      signin_in_admin admin
      redirect_to root_url
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out_admin
    redirect_to root_url
  end
end