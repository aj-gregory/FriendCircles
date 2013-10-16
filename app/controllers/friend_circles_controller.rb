class FriendCirclesController < ApplicationController
  def new
    render :new
  end

  def create
    @friend_circle = FriendCircle.new(params[:friend_circle])

    if @friend_circle.save
      redirect_to friend_circle_url(@friend_circle)
    else
      flash[:errors] = @friend_circle.errors.full_messages
      redirect_to new_friend_circle_url
    end
  end

  def show
    @friend_circle = FriendCircle.find(params[:id])
    render :show
  end

  def destroy

  end
end
