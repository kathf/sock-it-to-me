class SocksController < ApplicationController
  before_action :set_sock, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index]

  before_filter :store_location, only: [:edit, :show, :index]

  def index
    @socks = current_user.socks
    @sock = current_user.socks.new if @socks.empty?
  end

  def homepage
    @user = current_or_guest_user
    @sock = @user.socks.new
  end

  def edit
  end

  def show
    @order = @sock.build_order(amount: 1500)
  end

  def create
    @sock = current_or_guest_user.socks.create!(sock_params)
    if @sock.persisted?
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

    # store user's location in session - to return to after sign-up / log-in
    def store_location
      if request.get? && request.format.html? && !request.xhr? &&! devise_controller?
        session[:user_return_to] = request.fullpath
      end
    end
end
