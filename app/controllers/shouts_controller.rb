class ShoutsController < ApplicationController

	def create
		shout =	current_user.shouts.create(shout_params)
		redirect_to root_path, redirect_option_for(shout)
	end

	def show
		@shout = Shout.find(params[:id])
	end

	private

	def shout_params
		{content: content_from_params}
	end

	def content_from_params
		if params[:shout][:content_type] ==  "TextShout"
			TextShout.new(text_shout_content_params)
		elsif params[:shout][:content_type] == "PhotoShout"
			PhotoShout.new(photo_shout_content_params)
		end
	end

	def text_shout_content_params 
		params.require(:shout).require(:content).permit(:body)
	end

	def photo_shout_content_params 
		params.require(:shout).require(:content).permit(:image)
	end

	def redirect_option_for(shout)
		if shout.persisted?
			{notice: "Shout out!!"}
		else
			{alert: "shout not out!!"}
		end
	end
end
