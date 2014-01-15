class Admin::SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:notice] = "Successfully created subject."
      redirect_to new_admin_subject_path
    else
      flash.now[:error_messages] = "Fail to created subject. Subject might be exist"
      @subject = Subject.new if @subject.nil?
      render new_admin_subject_path
    end
  end

  def edit
    @subject = Subject.find params[:id]
  end

  def update
    @subject = Subject.find params[:id]
    if @subject.update_attributes! subject_params
      flash[:success] = "Question updated"
      redirect_to :back
    else
      flash[:error_messages] = "Question updated failed"
      render 'edit'
    end
  end

  def destroy
    @subject = Subject.find params[:id]
    if 0 == @subject.questions.length
      @subject.destroy
      flash[:success] = "Question deleted"
    else
      flash[:error_messages] = "Question can't be deleted"
    end
    redirect_to admin_subjects_url
  end

  private
    def subject_params
	    params.require(:subject).permit :subject_name
	  end
end
