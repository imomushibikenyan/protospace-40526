class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prototype, only: [:create]

  def create
    @comment = @prototype.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      # コメントの保存が成功した場合
      @comments = @prototype.comments
      redirect_to @prototype, notice: 'コメントが投稿されました。'
    else
      # コメントの保存が失敗した場合
      @comments = @prototype.comments
      render 'prototypes/show'
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
