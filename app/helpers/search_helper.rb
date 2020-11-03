module SearchHelper
  def search_results_url
    params[:return_url]
  end

  def filter_display_label(name, value)
    "#{names_mapping[name]}: #{value}"
  end

  def search_filters
    params[:filters] || ActionController::Parameters.new({})
  end

  def remove_filter_from_url(name, value)
    filters = params[:filters].deep_dup

    filters.each do |f_key, f_value|
      filters[f_key] = f_value - [value] if name == f_key
    end

    filters_to_merge = ActionController::Parameters.new({filters: filters}).permit!
    original_params  = params.except(:action, :controller).permit!

    records_path(original_params.merge(filters_to_merge))
  end

  def names_mapping
    {
      "years"  => "Année",
      "genres" => "Genre"
    }
  end
end
