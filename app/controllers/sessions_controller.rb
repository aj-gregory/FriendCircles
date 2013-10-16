class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])

    if @user.nil?
      redirect_to new_session_url
    else
      self.current_user = @user
      redirect_to user_url(@user)
    end
  end

  def destroy
    log_out_user!
    redirect_to new_session_url
  end

  def recover_password
    render :recover_password
  end

  def send_password
    @user = User.find_by_email(params[:user][:email])

    UserMailer.password_recovery_email(@user).deliver
    redirect_to new_session_url
  end

  def update_password
    @user = User.find_by_password_digest(params[:password_digest])

    if @user.nil?
      redirect_to new_session_url
    else
      self.current_user = @user
      redirect_to edit_user_url(@user)
    end
  end

end
