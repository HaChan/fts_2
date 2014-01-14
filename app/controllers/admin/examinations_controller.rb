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
	end

	def update
		@examination = Examination.find params[:id] 
    if @examination.update_attributes! examination_params
      flash[:success] = "Examination updated"
      redirect_to edit_admin_examination_path @examination
    else
      render 'edit'
    end
	end

	def destroy
		@examination = Examination.find params[:id]
		if @examination.nil?
			flash[:error] = "Examination is empty. You can't remove."
      redirect_to admin_examinations_path
    end
    if !@examination.using?
    	@examination.destroy
      flash[:success] = "Examination deleted."
    else
      flash[:error] = "Examination is using. You can't remove."
    end
    redirect_to admin_examinations_path
	end

	private

	    def examination_params
	      params.require(:examination).permit :subject_id, :number_question, 
	      	:duration, :datetime_exam, :exam_type 
	    end
end