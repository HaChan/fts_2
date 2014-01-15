class Admin::TestingsController < ApplicationController

	def index
		@testings = Testing.paginate page: params[:page], per_page: 3
	end

	def show
		@testing = Testing.find params[:id]
		@testing_questions = @testing.testing_questions
	end

	def update
		
	end
end