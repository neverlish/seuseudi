class CommentsController < ApplicationController
	def create
		@project = Project.find(params[:project_id])
		@comment = @project.comments.create(comment_params)
		@comment.user = current_user
		
		redirect_to project_path(@project)
	end

	private
		def comment_params
			params.require(:comment).permit(:body)
		end
end
