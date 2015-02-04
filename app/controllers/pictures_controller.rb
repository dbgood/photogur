class PicturesController < ApplicationController
	def index
		@pictures = Picture.all
	end

	def show
		@picture = Picture.find(params[:id])
	end

	def new
		@picture = Picture.new
	end

	def create
		#render :text => "Saving a picture. URL: #{params[:url]}, Title #{params[:title]}, Artist: #{params[:artist]}"
		@picture = Picture.new(picture_params)
    	if @picture.save
    		# if the save for the picture was successful, go to index.html.erb
    		redirect_to_pictures_url
		else
			# otherwise render the view associated with the action :new (i.e. new.html.erb)
		end
	end

	private
	def picture_params
		params.require(:picture).permit(:artist, :tite, :url)
		
	end
end