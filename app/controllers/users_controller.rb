class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      self.current_user = @user
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def edit
    @user = current_user
    render :edit
  end

  def update
    @user = current_user

    if @user.update_attributes(params[:user])
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.error
      redirect_to edit_user_url
    end
  end

end
