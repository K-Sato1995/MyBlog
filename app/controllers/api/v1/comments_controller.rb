module Api
  module V1
    class CommentsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        post = Post.find(params[:post_id])
        comment = post.comments.new(comment_params)

        if comment.save
          render json: { status: 'SUCCESS', message: 'Comment was successfully created', data: comment }
        else
          render json: { status: 'ERROR', message: 'An error occured', data: comment.errors }
        end
      end

      private

      def comment_params
        params.permit(:name, :content)
      end
    end
  end
end
