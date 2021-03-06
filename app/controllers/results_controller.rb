class ResultsController < ApplicationController
	before_action :authenticate_user!, :except => [:index]
	before_action :check_ownership!, only: [:update, :destroy]
	def new
		@result = Result.new
	end

	def create
		@project = Project.find(params[:project_id])
		@result = @project.results.create(result_params)
		
		uploader = ImageUploader.new
		uploader.store!(params[:image])
		@result.image = uploader.url

		attachmentuploader = AttachmentUploader.new
		attachmentuploader.store!(params[:attachment])
		@result.attachment = attachmentuploader.url

		@result.user = current_user
		@result.project_id = params[:project_id]

		if @result.save
			redirect_to @result
		else
			render 'new'
		end
	end

	def show
		@result = Result.find(params[:id])
	end

	def index
		@results = Result.all
	end

	def edit
		@result = Result.find(params[:id])
	end

	def update
		@result = Result.find(params[:id])

		if @result.update(result_params)
			redirect_to @result
		else
			render 'edit'
		end
	end

	def destroy
		@result = Result.find(params[:id])
		@result.destroy

		redirect_to results_path
	end

	private
		def result_params
			params.require(:result).permit(:project_id, :프로젝트명, :소개, :소감, :시작일자, :종료일자, :image, :attachment, :url)
		end

		def check_ownership!
		@result = Result.find_by(id: params[:id])
		redirect_to root_path if @result.user.id != current_user.id
	end
end
