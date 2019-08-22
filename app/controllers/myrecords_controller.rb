class MyrecordsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = <<~SQL
        title @@ :query
        OR artist @@ :query
      SQL
      @myrecords = current_user.records.joins(:release).where(sql_query, query: "%#{params[:query]}%")
    else
      @myrecords = current_user.records
    end
  end
end
