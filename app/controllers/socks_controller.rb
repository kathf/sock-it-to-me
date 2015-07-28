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
  end

  def create
    @sock = Sock.new(sock_params)
    if @sock.save
      redirect_to edit_sock_path(@sock)
    else
      render :new
    end
  end

  def update
    if @sock.update(sock_params)
      redirect_to @sock
    else
      render :edit
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
        :fabric,
        :height,
        :size,
        :toes_separator,
        :big_toe_separator,
        :heel_padding,
        :comments,
        :avatar_cache,
        :avatar
        )
    end
end
