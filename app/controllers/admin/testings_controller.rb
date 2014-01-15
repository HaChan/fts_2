class Admin::TestingsController < ApplicationController

	def index
		@testings = Testing.paginate page: params[:page], per_page: 3
	end

	def update
		
	end
end