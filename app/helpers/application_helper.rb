module ApplicationHelper
  def full_title page_title
    base_title = "Framgia Test System"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def to_csv_for (model_name, options = {})
    csv_string = CSV.generate(options) do |csv|
      csv << model_name.column_names
      model_name.all.each do |table|
        csv << table.attributes.collect{ |_, attribute| attribute }
      end
    end
  end

end
