class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @status = Status.find(params[:like][:status])

    if !Like.find_by(status_id: params[:like][:status])
      @like = Like.new(status_id: params[:like][:status], user_id: params[:like][:user])
      if @like.save
        flash[:notice] = "You liked #{@status.title}!"
        redirect_to root_path
      else
        redirect_to root_path
      end
    else
      flash[:alert] = "You liked before!"
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    flash[:notice] = "You unlike."
    redirect_to status_path(@like.status_id)
  end
end
