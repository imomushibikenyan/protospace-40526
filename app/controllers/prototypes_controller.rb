class PrototypesController < ApplicationController
  # サインインしていないユーザーのアクセスを制限する
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_active_storage_current_url_options, only: [:show] # showアクションのみで設定
  before_action :set_prototype, only: [:show, :edit, :update, :destroy] # show, edit, updateアクションで設定

  def index
    @prototypes = Prototype.all
  end

  def show
    @prototype = Prototype.find(params[:id])
    # 追加の処理はここに記述する（例えば、コメントの取得など）
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.build(prototype_params) 

    if @prototype.save
      redirect_to root_path, notice: 'Prototype was successfully created.'
    else
      render :new
    end
  end

  def edit
    # @prototype is already set by the set_prototype method
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to @prototype, notice: 'Prototype was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @prototype.destroy
    redirect_to prototypes_url, notice: 'Prototype was successfully destroyed.'
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def set_active_storage_current_url_options
    ActiveStorage::Current.url_options = {
      host: request.host,
      port: request.port,
      protocol: request.protocol
    }
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
