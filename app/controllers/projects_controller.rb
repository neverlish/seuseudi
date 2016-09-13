class ProjectsController < ApplicationController
	before_action :authenticate_user!, :except => [:show, :index]
	before_action :check_ownership!, only: [:update, :destroy]
	def new
	end

	def create
		@project = Project.new(project_params)
		@project.user = current_user

		@project.save
		redirect_to @project
	end

	def show
		@project = Project.find(params[:id])
	end

	def index
		@projects = Project.all
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])

		if @project.update(project_params)
			redirect_to @project
		else
			render 'edit'
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy

		redirect_to projects_path
	end

	private
		def project_params
			params.require(:project).permit(:프로젝트명, :일정, :목표, :photo)
		end

		def check_ownership!
		@project = Project.find_by(id: params[:id])
		redirect_to root_path if @project.user.id != current_user.id
	end
end
