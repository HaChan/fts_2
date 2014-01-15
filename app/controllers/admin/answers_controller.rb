class Admin::AnswersController < ApplicationController
  def destroy
    answer = Answer.find params[:id]
    @answer_id = params[:id]
    question_id = answer.question_id
    answer.destroy
    respond_to do |format|
      format.js {}
    end
  end
end
