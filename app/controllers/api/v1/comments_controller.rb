module Api
  module V1
    class CommentsController < ApplicationController
      def create
        post = Post.find(params[:post_id])
        comment = post.comments.new(comment_params)

        if comment.save
          render json: { status: 'SUCCESS', message: 'Comment was successfully created', data: comment }
        else
          render json: { status: 'ERROR', message: 'An error occured', data: comment.errors }
        end
        CommentMailer.comment_email(post.slug, comment.name, comment.content).deliver_now
      end

      private

      def comment_params
        params.permit(:name, :content)
      end
    end
  end
end
