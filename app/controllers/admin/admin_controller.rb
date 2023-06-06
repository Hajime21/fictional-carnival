class Admin::AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin!
  
    def index
      @users = User.all
    end
  
    def show
      @user = User.find(params[:id])
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_user_path(@user), notice: "User was successfully created."
      else
        render :new
      end
    end
  
    def edit
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_user_path(@user), notice: "User was successfully updated."
      else
        render :edit
      end
    end
  
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path, notice: "User was successfully destroyed."
    end
  
    private
  
    def authorize_admin!
      unless current_user.admin?
        flash[:alert] = "You are not authorized to access this page."
        redirect_to root_path
      end
    end
  
    def user_params
      params.require(:user).permit(:imie, :nazwisko, :pseudonim, :wiek, :email, :admin, :password, :password_confirmation)
    end

    def trainings
      @user = User.find(params[:id])
      @trainings = @user.trainings
    end

  end