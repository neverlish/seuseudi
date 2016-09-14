class ThumbsupsController < ApplicationController
	before_action :authenticate_user!

  def thumbsup_toggle
    thumbsup = Thumbsup.find_by(user_id: current_user.id,
                        result_id: params[:result_id])

    if thumbsup.nil?
      Thumbsup.create(user_id: current_user.id,
                  result_id: params[:result_id])
    else
      thumbsup.destroy
    end

    redirect_to :back
  end
end
