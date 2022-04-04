class AdminController < ApplicationController
    protect_from_forgery prepend: true
    before_action :authenticate_user!, only: %i[ index show edit update destroy ]

    # redirect_to(:back)
end