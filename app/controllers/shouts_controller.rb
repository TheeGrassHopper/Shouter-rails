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
		{content: content_from_params}
	end

	def content_from_params
		TextShout.new(content_params)
	end

	def content_params 
		params.require(:shout).require(:content).permit(:body)
	end

	def redirect_option_for(shout)
		if shout.persisted?
			{notice: "Shout out!!"}
		else
			{alert: "shout not out!!"}
		end
	end
end
