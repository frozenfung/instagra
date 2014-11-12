class WelcomeController < ApplicationController

	def index
    @photos = Photo.order("created_at DESC")

	end
end
