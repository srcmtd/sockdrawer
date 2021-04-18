class UpdatesController < ApplicationController
  before_action :set_sock, only: :create

  def create
    @update = @sock.updates.new update_params
    if @update.save
      redirect_to @sock, notice: "It worked!"
    else
      redirect_to @sock, error: "It did not work"
    end
  end

  private

  def set_sock
    @sock = Sock.find(params[:sock_id])
  end

  def update_params
    params.require(:update).permit(:body, :sock_id)
  end
end
