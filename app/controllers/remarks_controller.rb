class RemarksController < ApplicationController
	before_action :authenticate_user!
	before_action :check_ownership!, only: [:update, :destroy]
	def create
		new_remark = Remark.new(remark_params)
		new_remark.user = current_user
		new_remark.result_id = params[:result_id]
		new_remark.save

		redirect_to :back
	end

	def destroy
		@remark.destroy
		redirect_to :back
	end

	private
	def check_ownership!
		@remark = Remark.find_by(id: params[:id])
		redirect_to root_path if @remark.user.id != current_user.id
	end

	def remark_params
		params.require(:remark).permit(:body)
	end
end
