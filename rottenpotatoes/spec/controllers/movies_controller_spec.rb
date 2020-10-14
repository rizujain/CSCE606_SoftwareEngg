require 'rails_helper'

describe MoviesController do
  describe 'Search movies by the same director' do
    it 'should call Movie.similar_movies' do
      expect(Movie).to receive(:director_common_movies).with('MyMovie')
      get :director_common, { title: 'MyMovie' }
    end

    it 'should assign similar movies if director exists' do
      movies = ['MyMovie1', 'MyMovie2']
      Movie.stub(:director_common_movies).with('MyMovie1').and_return(['MyMovie1',movies])
      get :director_common, { title: 'MyMovie1' }
      expect(assigns(:director_common_movies)).to eql(movies)
    end

    it "should redirect to home page if director isn't known" do
      Movie.stub(:director_common_movies).with('MyMovieNoDirector').and_return(['MyMovieNoDirector',nil])
      get :director_common, { title: 'MyMovieNoDirector' }
      expect(response).to redirect_to(root_url)
    end
  end
end
