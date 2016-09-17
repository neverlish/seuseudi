class ResultsController < ApplicationController
	before_action :authenticate_user!, :except => [:show, :index]
	before_action :check_ownership!, only: [:update, :destroy]
	def new
		@result = Result.new
	end

	def create
		@result = Result.new(result_params)
		@result.user = current_user

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
			params.require(:result).permit(:프로젝트명, :소개, :소감, :시작일자, :종료일자, :attachment)
		end

		def check_ownership!
		@result = Result.find_by(id: params[:id])
		redirect_to root_path if @result.user.id != current_user.id
	end
end
