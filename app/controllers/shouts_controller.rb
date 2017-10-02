class ShoutsController < ApplicationController

	def show
		@shouts = Shout.find(params[:id])
	end

	def create
		shout =	current_user.shouts.create(shout_params)
		redirect_to root_path, redirect_option_for(shout)
	end

	private

	def shout_params
		params.require(:shout).permit(:body)
	end

	def redirect_option_for(shout)
		if shout.persisted?
			{notice: "Shout out!!"}
		else
			{alert: "shout not out!!"}
		end
	end
end
