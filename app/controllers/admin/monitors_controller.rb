class Admin::MonitorsController < ApplicationController
  include ApplicationHelper
  def index
    @tables = Array.new
    ActiveRecord::Base.connection.tables.each do |table|
      @tables << table.camelize.singularize if table != "schema_migrations" &&
       table != "admins"
    end
  end

  def show
    table = params[:table]
    respond_to do |format|
      format.csv {
        case table
        when "User"
              send_data to_csv_for(User)
        when "Subject"
              send_data to_csv_for(Subject)
        when "Question"
              send_data to_csv_for(Question)
        when "Answer"
              send_data to_csv_for(Answer)
        when "Examination"
              send_data to_csv_for(Examination)
        when "TestingQuestion"
              send_data to_csv_for(TestingQuestion)
        when "TestingAnswer"
              send_data to_csv_for(TestingAnswer)
        when "Testing"
              send_data to_csv_for(Testing)
        when "TypeQuestion"
              send_data to_csv_for(TypeQuestion)
        end
      }
    end
  end

  def create
    table = params[:table]
    case table
    when "User"
      import(params[:file], User)
    when "Subject"
      Subject.import(params[:file])
      import(params[:file], Subject)
    when "Question"
      import(params[:file], Question)
    when "Answer"
      import(params[:file], Answer)
    when "Examination"
      import(params[:file], Examination)
    when "TestingQuestion"
      import(params[:file], TestingQuestion)
    when "TestingAnswer"
      import(params[:file], TestingAnswer)
    when "Testing"
      import(params[:file], Testing)
    when "TypeQuestion"
      import(params[:file], TypeQuestion)
    end
    redirect_to :back, notice: "Tables imported."
  end
end
