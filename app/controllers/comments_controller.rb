class CommentsController < ApplicationController
  before_action :set_user
  before_action :set_comment, only: ['edit', 'update', 'destroy']

  def create
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic

    respond_to do |format|
      if @comment.save
        format.html {redirect_to topic_path(@topic), notice: 'コメントを投稿しました。'}
        format.js { render :index }
      else
        format.html {render :new}
      end
    end
  end


  def edit
    @topic = Topic.find(params[:topic_id])
  end

  def update
    @topic = @comment.topic
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to topic_path(@topic), notice: 'コメントを更新しました。' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @topic = @comment.topic
    if @comment.destroy
      redirect_to topic_path(@topic), notice: 'コメントの削除に成功しました。'
    else
      redirect_to topic_path(@topic), notice: 'コメントの削除に失敗しました。'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:topic_id, :content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end

