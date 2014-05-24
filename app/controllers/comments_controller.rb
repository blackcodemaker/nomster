class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@place.Place.find(params[:place_id])
		@place.comments.create(comment_params.merge(:user => current_user))
		redrect_to place_path(@place)
	end

	private

	params.require(:comment).permit(:message, :rating)
end
