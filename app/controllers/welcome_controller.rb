class WelcomeController < ApplicationController
  def index
    @photos = Photo.includes(:comments).all
  end
end
