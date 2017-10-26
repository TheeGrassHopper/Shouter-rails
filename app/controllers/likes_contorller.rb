class LikesContoller < ApplicationController

	def create
		current_user.like(shout)
	end

	private

	def shout
		@_shout ||= Shout.find(params[:id])
	end
end