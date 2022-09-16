class CommentsController < ApplicationController
    def create
     
        @topic=Topic.find(params[:comment][:topic_id])
        @topics = Topic.all.includes(:favorite_users)
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.topic_id = @topic.id
        if @comment.save
            redirect_to request.referer, success:'コメントを投稿しました'

        else 
            flash.now[:danger] = 'コメントに失敗しました'
            render "topics/index"
        end
    end

    private 
    def comment_params
        params.require(:comment).permit(:content,:topic_id,:user_id)
    end

end
