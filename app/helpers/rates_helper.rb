module RatesHelper

  def render_rate_movie_select_tag(rate)
    return if rate.blank?
    collection_select :rate, :movie_id, Movie.all, :id, :name, {:prompt => "选择电影"}, :style => "width:145px;"
  end

  
  
end
