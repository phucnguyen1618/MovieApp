import 'package:flutter_movie_app/data/api/cast_response.dart';
import 'package:flutter_movie_app/data/api/genres_response.dart';
import 'package:flutter_movie_app/data/api/movie_credits_response.dart';
import 'package:flutter_movie_app/data/api/movie_detail_response.dart';
import 'package:flutter_movie_app/data/api/movie_request.dart';
import 'package:flutter_movie_app/data/api/movie_response.dart';
import 'package:flutter_movie_app/data/api/person_detail_response.dart';
import 'package:flutter_movie_app/data/api/person_response.dart';
import 'package:flutter_movie_app/data/api/reviews_response.dart';

class MovieRepository {
  final MovieRequest _movieRequest = MovieRequest();

  Future<MovieResponse> getMoviesPopular() =>
      _movieRequest.getRequestPopularListMovies();

  Future<MovieResponse> getMoviesTopRated() =>
      _movieRequest.getRequestTopRatedListMovies();

  Future<GenresResponse> getAllGenres() => _movieRequest.getRequestGenresList();

  Future<MovieResponse> getNowPlaying() =>
      _movieRequest.getRequestNowPlayingListMovies();

  Future<MovieResponse> getMoviesListWithGenres(int idGenres) =>
      _movieRequest.getMovieListWithGenresById(idGenres);

  Future<PersonResponse> getTrendingListPerson() =>
      _movieRequest.getTrendingListPerson();

  Future<MovieDetailResponse> getMovieDetail(int id) =>
      _movieRequest.getMovieDetailById(id);

  Future<MovieResponse> getSimilarMoviesList(int id) =>
      _movieRequest.getSimilarMoviesList(id);

  Future<CastResponse> getCasts(int id) =>
      _movieRequest.getListCastForMovie(id);

  Future<PersonDetailResponse> getPersonDetail(int id) =>
      _movieRequest.getDetailPerson(id);

  Future<MovieCreditResponse> getMoviePersonCredit(int id) =>
      _movieRequest.getListMoviePersonCredit(id);

  Future<ReviewsResponse> getReviews(int id) =>
      _movieRequest.getUserReviewsForMovie(id);
}
