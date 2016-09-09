class CommentsController < ApplicationController
	def create
		new_comment = Comment.new(body: params[:body],
								  project_id: params[:project_id],
								  user_id: current_user.id)
		new_comment.save

		redirect_to :back
	end


end
