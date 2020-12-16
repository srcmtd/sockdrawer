class SocksController < ApplicationController
  before_action :set_sock, only: [:show, :edit, :update, :mark_clean, :mark_dirty, :destroy]

  def index
    @socks = Sock.clean
  end

  def dirty
    @socks = Sock.dirty
  end

  def new
    @sock = Sock.new
    @sock.set_full_name
    @sock.set_location
  end

  def create
    @sock = Sock.new(sock_params)

    respond_to do |format|
      if @sock.save
        format.html { redirect_to @sock, notice: 'Sock was successfully created.' }
        format.json { render :show, status: :created, location: @sock }
      else
        format.html { render :new }
        format.json { render json: @sock.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sock.update(sock_params)
        format.html { redirect_to @sock, notice: 'Sock was successfully updated.' }
        format.json { render :show, status: :ok, location: @sock }
      else
        format.html { render :edit }
        format.json { render json: @sock.errors, status: :unprocessable_entity }
      end
    end
  end

  def mark_clean
    respond_to do |format|
      if @sock.clean!
        format.html { redirect_to @sock, notice: "Sock was marked as 'clean.'" }
        format.json { render :show, status: :ok, location: @sock }
      else
        format.html { render :edit }
        format.json { render json: @sock.errors, status: :unprocessable_entity }
      end
    end
  end

  def mark_dirty
    respond_to do |format|
      if @sock.dirty!
        format.html { redirect_to @sock, notice: "Sock was marked as 'dirty.'" }
        format.json { render :show, status: :ok, location: @sock }
      else
        format.html { render :edit }
        format.json { render json: @sock.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sock.destroy
    respond_to do |format|
      format.html { redirect_to socks_url, notice: 'Sock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_sock
    @sock = Sock.find(params[:id])
  end


  def sock_params
    params.require(:sock).permit(:code_name, :first_name, :middle_name, :last_name, :birthday, :interests, :skills, :languages, :operating_system, :mobile_device, :neighborhood, :city, :state, :country)
  end
end
