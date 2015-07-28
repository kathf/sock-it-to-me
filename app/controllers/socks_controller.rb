class SocksController < ApplicationController
  before_action :set_sock, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_member!, only: [:index]

  def index
    @socks = curent_user.socks
  end

  def new
    @sock = Sock.new
  end

  def edit
  end

  def show
    @sock
  end

  def create
    @sock = Sock.new(sock_params)
    if @sock.save
      redirect_to @sock
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @sock.update(sock_params)
        format.html { redirect_to @sock }
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
      params.require(:sock).permit(
        :material,
        :height_cm,
        :size,
        :fingertoes,
        :heel_padding,
        :comments,
        :avatar_cache,
        :avatar
        )
    end
end
