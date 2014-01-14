class Admin::ExaminationsController < ApplicationController

	def index
		
	end

	def new
		@examination = Examination.new
		@subjects = Subject.all
	end

	def create
		@examination= Examination.new examination_params
	    if @examination.save
	      flash[:success] = "Create new examination success!"
	      redirect_to edit_admin_examination_path @examination
	    else
	    	@subjects = Subject.all
	      render 'new'
	    end
	end

	def edit
		@examination = Examination.find params[:id]
		@subjects = Subject.all
		#@examination_questions = @examination.examination_questions
	end

	def update
		
	end

	def destroy
		
	end

	private

	    def examination_params
	      params.require(:examination).permit(:subject_id, :number_question, 
	      	:duration, :datetime_exam, :exam_type)
	    end
end