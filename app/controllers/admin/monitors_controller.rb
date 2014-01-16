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
    case table
    when "User"
      respond_to do |format|
        format.csv {
          send_data to_csv_for(User)
        }
      end
    when "Subject"
      respond_to do |format|
        format.csv {
          send_data to_csv_for(Subject)
        }
      end
    when "Question"
      respond_to do |format|
        format.csv {
          send_data to_csv_for(Question)
        }
      end
    when "Answer"
      respond_to do |format|
        format.csv {
          send_data to_csv_for(Answer)
        }
      end
    when "Examination"
      respond_to do |format|
        format.csv {
          send_data to_csv_for(Examination)
        }
      end
    when "TestingQuestion"
      respond_to do |format|
        format.csv {
          send_data to_csv_for(TestingQuestion)
        }
      end
    when "TestingAnswer"
      respond_to do |format|
        format.csv {
          send_data to_csv_for(TestingAnswer)
        }
      end
    when "Testing"
      respond_to do |format|
        format.csv {
          send_data to_csv_for(Testing)
        }
      end
    when "TypeQuestion"
      respond_to do |format|
        format.csv {
          send_data to_csv_for(TypeQuestion)
        }
      end
    end
  end

  def create
  end
end
