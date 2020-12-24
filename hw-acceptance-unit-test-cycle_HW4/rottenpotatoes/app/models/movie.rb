class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.director_common_movies curr_title
    curr_movie = Movie.find_by(title: curr_title)
    curr_director = curr_movie.director
    return curr_movie,nil if curr_director.blank? or curr_director.nil?
    same_director_movies = Movie.where(director: curr_director).pluck(:title)
    return curr_movie, same_director_movies
  end
end
