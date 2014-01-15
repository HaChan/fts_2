class Admin::AssignedUsersController < ApplicationController

	def create
		@testing = Testing.create! examination_id: params[:examination_id], 
		                user_id: params[:user_id]
		@examination = @testing.examination
	end

	def destroy
		@testing = Testing.find params[:id]
    @testing.destroy!
    @examination = @testing.examination
    @user = @testing.user
	end

end