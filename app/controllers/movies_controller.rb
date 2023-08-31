class MoviesController < ApplicationController
  def index
    # raise
    @movies = Movie.all
    if params[:query]
      # @movies = Movie.where(title: params[:query])
      # @movies = Movie.where('title ILIKE :query OR synopsis ILIKE :query', query: "%#{params[:query]}%")
      # sql_subquery = <<~SQL
      #   movies.title @@ :query
      #   OR movies.synopsis @@ :query
      #   OR directors.first_name @@ :query
      #   OR directors.last_name @@ :query
      # SQL
      # @movies = Movie.joins(:director).where(sql_subquery, query: "%#{params[:query]}%")

      # USE PG SEARCH
      # @movies = Movie.search_by_title_and_synopsis(params[:query])
      # @movies = Movie.global_search(params[:query])
      @movies = PgSearch.multisearch(params[:query])
    end
  end
end
