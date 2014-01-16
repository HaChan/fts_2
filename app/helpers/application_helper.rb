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

  def import(file, model_name)
    CSV.foreach(file.path, headers: true) do |row|
      model_hash = row.to_hash
      model_hash[:id] = nil
	    new_model = model_name.new model_hash
	    new_model.save! validate: false
    end
  end

end
