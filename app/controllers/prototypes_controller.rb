class PrototypesController < ApplicationController
  # サインインしていないユーザーのアクセスを制限する
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_active_storage_current_url_options

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.build(prototype_params) # current_userに紐付ける

    if @prototype.save
      redirect_to root_path, notice: 'Prototype was successfully created.'
    else
      render :new
    end
  end

  private

  def set_active_storage_current_url_options
    ActiveStorage::Current.url_options = {
      host: request.host,
      port: request.port,
      protocol: request.protocol
    }
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end
end
