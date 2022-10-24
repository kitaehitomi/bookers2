class UsersController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books#アソシエーションの時に使えるもの

  end

  def edit
    @user  = User.find(params[:id])
      if @user==current_user
      render "edit"
      else
      redirect_to user_path(current_user)
      end

  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         redirect_to user_path(@user.id),notice: "User was successfully updated."
      else
         render :edit

      end

  end
     private

    def user_params
      params.require(:user).permit(:name, :profile_image,:introduction)
    end
  end
