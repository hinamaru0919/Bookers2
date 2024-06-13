class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.save
    redirect_to '/top'
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def edit
    user = User.find(params[:id])
    @user = User.find_by(id: current_user.id)
    unless user.id == current_user.id
      redirect_to current_user
    end
  end

  def update
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to @user
    end
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
       flash.now[:alert] = 'Failed to update user.'
       render :edit
    end
  end

  def destroy
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :image, :introduction)
  end
end