class StatusesController < ApplicationController
  
  def index
    @statuses = Status.order('created_at')
  end

  def show
    @status = Status.find(params[:id])
  end

  def new
    if logged_in?
      @status = Status.new
    else
      redirect_to login_path
    end
  end

  def create
    if logged_in?
      @status = Status.new(status_params)
      if @status.save
        flash[:notice] = "Status is created successfully."
        redirect_to @status
      else
        flash[:alert] = "Error creating status."
        render "new"
      end
    else
      redirect_to login_path
    end
  end


  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])

    if logged_in?
      if @status.update_attributes(status_params)
        flash[:notice] = "Status is updated successfully."
        redirect_to @status
      else
        render "edit"
      end
    else
      redirect_to login_path
    end
  end

  def destroy
    Status.find(params[:id]).destroy
    flash[:notice] = "Status is deleted."
    redirect_to statuses_path
  end

  private

    def status_params
      params.require(:status).permit(:title, :content)
    end
end
