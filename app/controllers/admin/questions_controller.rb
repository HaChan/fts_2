class Admin::QuestionsController < ApplicationController
  respond_to :html, :js
  def index

  end

  def new
    @subjects = Subject.all
    type_question = params[:type_question]
    if type_question.nil?
      @question = Question.new type_question_id: 3
    else
      @question = Question.new type_question_id: type_question
    end
    @type_questions = TypeQuestion.all
    answer_num = params[:answer_num].to_i
    answer_num.times { @question.answers.build }
    respond_with @question, location: new_admin_question_url
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:notice] = "Successfully created question."
      redirect_to new_admin_question_path
    else
      flash.now[:error_messages] = "Fail to created question."
      render new_admin_question_path
    end
  end

  def edit
  end

  def update
  end

  private
    def question_params
	    params.require(:question).permit :subject_content, :subject_id,
	      :type_question_id, answers_attributes: [:answer_content, :status]
	  end
end
