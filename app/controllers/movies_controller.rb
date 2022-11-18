class MoviesController < ApplicationController
  before_action :set_movie

  def index
    @movies = Movie.all
  end

  def show
    @movies = Movie.find(params[:id])
  end

  def new
    @movies = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def destroy
    @movie.destroy
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating, :review)
  end

  def set_restaurant
    @movie = Movie.find(params[:id])
  end
end
