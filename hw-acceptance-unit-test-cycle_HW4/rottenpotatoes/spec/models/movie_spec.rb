require 'rails_helper'

describe Movie do
  describe '.find_similar_movies' do
    let!(:movie1) { FactoryGirl.create(:movie, title: 'MyMov1', director: 'OurDir') }
    let!(:movie2) { FactoryGirl.create(:movie, title: 'MyMov2', director: 'OurDir') }
    let!(:movie3) { FactoryGirl.create(:movie, title: "MyMov3", director: 'NotOurDir') }
    let!(:movie4) { FactoryGirl.create(:movie, title: "MyMovNoDir") }

    context 'director exists' do
      it 'finds similar movies correctly' do
        expect(Movie.director_common_movies(movie1.title)).to eql([movie1, ['MyMov1', "MyMov2"]])
        expect(Movie.director_common_movies(movie1.title)).to_not include([movie1, ['MyMov3']])
      end
    end

    context 'director does not exist' do
      it 'handles sad path' do
        expect(Movie.director_common_movies(movie4.title)).to eql([movie4, nil])
      end
    end
  end
  
  describe '.all_ratings' do
    it 'returns all ratings' do
      expect(Movie.all_ratings).to match(%w(G PG PG-13 NC-17 R))
    end
  end
end