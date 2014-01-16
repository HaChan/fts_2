class Admin::TestingsController < ApplicationController 

	def index
		@testings = Testing.paginate page: params[:page], per_page: 3
	end

	def show
		@testing = Testing.find params[:id]
		@testing_questions = @testing.testing_questions
	end

	def edit
		@testing = Testing.find params[:id]
		@testing.evaluate_auto unless @testing.evaluated?
		@testing_questions = @testing.testing_questions
	end

	def update
		@testing = Testing.find params[:id]
    if @testing.update_attributes testing_params
      flash[:success] = "Testing is evaluated"
      redirect_to :back
    else
      render 'edit'
    end
	end

	private
    def testing_params
	    params.require(:testing).permit testing_questions_attributes: 
	                                    [:id, :correct]
	  end
end