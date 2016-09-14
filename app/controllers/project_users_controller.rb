class ProjectUsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_project

	def create
		if (@project.project_users.length < @project.인원)
			@project_user = @project.project_users.where(user_id: current_user.id).first_or_create
			redirect_to @project
		else 
			redirect_to projects_path
		end
	end

	def destroy
		if (@project.user != current_user)
			@project_user = @project.project_users.where(user_id: current_user.id).destroy_all
		end
		redirect_to :back
	end

	private

	def set_project 
		@project = Project.find(params[:project_id])
	end
end