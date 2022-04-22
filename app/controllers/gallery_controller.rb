class GalleryController < ApplicationController
  def index
    gallery = Gallery::Service.new(1)
    gallery.call
    @users = gallery.users
  end
end
