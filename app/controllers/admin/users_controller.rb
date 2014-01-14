class Admin::UsersController < ApplicationController
  include UsersHelper
  before_action :signed_in_admin

  def index
    @users = User.paginate page: params[:page], per_page: 2
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Create success"
      redirect_to admin_users_path
    else
      flash[:success] = "Failed"
      render "new"
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes password: params[:user][:password],
                   password_confirmation: params[:user][:password_confirmation]
      flash[:success] = @user.name << " has reset password"
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end
  
  def show
    @user = User.find params[:id]
  end

  def destroy
    user = User.find params[:id]
    unless user.nil?
      user.destroy!
      flash[:success] = "User deleted."
    end
    redirect_to admin_users_path
  end
  
  private
    def user_params
      params.require(:user).permit :name, :password,:password_confirmation, :email
    end
end