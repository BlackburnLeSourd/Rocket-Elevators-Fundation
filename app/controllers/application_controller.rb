class ApplicationController < ActionController::Base
  protect_from_forgery with: :reset_session
end
# class PostsController < ApplicationController
  
#     load_and_authorize_resource
  
#     def show
#       # @post is already loaded and authorized
#     end
  
#     def index
#       # @posts is already loaded with all posts the user is authorized to read
#     end
#   end