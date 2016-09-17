class NoticesController < ApplicationController
	before_action :authenticate_user!
	before_action :check_ownership!, only: [:update, :destroy]
	def create
		new_notice = Notice.new(notice_params)
		new_notice.user = current_user
		new_notice.project_id = params[:project_id]
		new_notice.save

		redirect_to :back
	end

	def destroy
		@notice.destroy
		redirect_to :back
	end

	private
	def check_ownership!
		@notice = Notice.find_by(id: params[:id])
		redirect_to root_path if @notice.user.id != current_user.id
	end

	def notice_params
		params.require(:notice).permit(:body)
	end
end
