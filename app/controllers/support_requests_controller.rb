class SupportRequestsController < ApplicationController
  def index
    @supreq = SupportRequest.all
  end

  def edit
    @supreq = SupportRequest.find(params[:id])
  end

  def new
    @supreq = SupportRequest.new
  end

  def show
  end

  def update
    @supreq = SupportRequest.find(params[:id])
    if @supreq.update supreq_params
      redirect_to support_requests_path
    else
      render :edit
    end
  end

  def destroy
    @supreq = SupportRequest.find(params[:id])
      @supreq.destroy
      redirect_to root_path
  end

  def create
    @supreq = SupportRequest.new supreq_params
    if @supreq.save
      redirect_to support_requests_path
    else
      render :new
    end
  end

  private

  def supreq_params
    params.require(:support_request).permit([:name, :email, :departemnt, :message])
  end

end
