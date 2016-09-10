class ProjectUsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_project

	def create
		@project_user = @project.project_users.where(user_id: current_user.id).first_or_create
		redirect_to @project
	end

	def destroy
		@project_user = @project.project_users.where(user_id: current_user.id).destroy_all
		redirect_to projects_path
	end

	private

	def set_project 
		@project = Project.find(params[:project_id])
	end
end