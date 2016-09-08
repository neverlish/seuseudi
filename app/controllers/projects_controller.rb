class ProjectsController < ApplicationController
	before_action :authenticate_user!, :except => [:show, :index]
	def new
	end

	def create
		@project = Project.new(project_params)

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
			params.require(:project).permit(:프로젝트명, :일정, :목표)
		end
end
