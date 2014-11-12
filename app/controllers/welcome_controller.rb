class WelcomeController < ApplicationController

	def index
    if params[:tag]
      @tag = Tag.find_by_name( params[:tag] )
      @photos = @tag.photos.order("photos.created_at DESC")
    else
      @photos = Photo.order("created_at DESC")
    end
	end
end

