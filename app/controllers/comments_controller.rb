class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_ownership!, only: [:update, :destroy]
	def create
		new_comment = Comment.new(comment_params)
		new_comment.user = current_user
		new_comment.project_id = params[:project_id]
		new_comment.save

		redirect_to :back
	end

	def destroy
		@comment.destroy
		redirect_to :back
	end

	private
	def check_ownership!
		@comment = Comment.find_by(id: params[:id])
		redirect_to root_path if @comment.user.id != current_user.id
	end

	def comment_params
		params.require(:comment).permit(:body)
	end
end
