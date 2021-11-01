import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/api/cast_response.dart';
import 'package:flutter_movie_app/data/api/genres_response.dart';
import 'package:flutter_movie_app/data/api/movie_credits_response.dart';
import 'package:flutter_movie_app/data/api/movie_response.dart';
import 'package:flutter_movie_app/data/api/person_detail_response.dart';
import 'package:flutter_movie_app/data/api/reviews_response.dart';

import 'movie_detail_response.dart';
import 'person_response.dart';

class MovieRequest {
  final String _apiKey = '908be91eea0ad0812b9d0846ad55eed3';
  static const String _urlRequest = 'https://api.themoviedb.org/3';
  final String _popularUrl = '$_urlRequest/movie/popular';
  final String _topRatedUrl = '$_urlRequest/movie/top_rated';
  final String _movieWithGenresUrl = '$_urlRequest/discover/movie';
  final String _nowPlayingUrl = '$_urlRequest/movie/now_playing';
  final String _genresUrl = '$_urlRequest/genre/movie/list';
  final String _personUrl = '$_urlRequest/trending/person/week';
  final String _movieUrl = '$_urlRequest/movie/';
  final String _personDetailUrl = '$_urlRequest/person/';

  final Dio _dio = Dio();

  MovieRequest();

  Future<MovieResponse> getRequestPopularListMovies() async {
    var params = {'api_key': _apiKey, 'language': 'en-US', 'page': 1};
    try {
      Response response = await _dio.get(_popularUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error) {
      return MovieResponse.withError(error.toString());
    }
  }

  Future<MovieResponse> getRequestTopRatedListMovies() async {
    var params = {'api_key': _apiKey, 'language': 'en-US', 'page': 1};
    try {
      Response response = await _dio.get(_topRatedUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error) {
      return MovieResponse.withError(error.toString());
    }
  }

  Future<MovieResponse> getRequestNowPlayingListMovies() async {
    var params = {'api_key': _apiKey, 'language': 'en-US', 'page': 1};
    try {
      Response response =
          await _dio.get(_nowPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error) {
      return MovieResponse.withError(error.toString());
    }
  }

  Future<GenresResponse> getRequestGenresList() async {
    var params = {'api_key': _apiKey, 'language': 'en-US'};
    try {
      Response response = await _dio.get(_genresUrl, queryParameters: params);
      return GenresResponse.fromJson(response.data);
    } catch (error) {
      return GenresResponse.withError(error.toString());
    }
  }

  Future<MovieResponse> getMovieListWithGenresById(int id) async {
    var params = {
      'api_key': _apiKey,
      'language': 'en-US',
      'with_genres': id.toString()
    };
    try {
      Response response =
          await _dio.get(_movieWithGenresUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error) {
      return MovieResponse.withError(error.toString());
    }
  }

  Future<PersonResponse> getTrendingListPerson() async {
    var params = {
      'api_key': _apiKey,
    };
    try {
      Response response = await _dio.get(_personUrl, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch (error) {
      return PersonResponse.withError(error.toString());
    }
  }

  Future<MovieDetailResponse> getMovieDetailById(int id) async {
    var params = {
      'api_key': _apiKey,
      'language': 'en-US',
    };
    try {
      Response response =
          await _dio.get(_movieUrl + '$id', queryParameters: params);
      return MovieDetailResponse.fromJson(response.data);
    } catch (error) {
      return MovieDetailResponse.withError(error.toString());
    }
  }

  Future<CastResponse> getListCastForMovie(int id) async {
    var params = {
      'api_key': _apiKey,
      'language': 'en-US',
    };
    try {
      Response response = await _dio.get(_movieUrl + '$id' + '/credits',
          queryParameters: params);
      return CastResponse.fromJson(response.data);
    } catch (error) {
      return CastResponse.withError(error.toString());
    }
  }

  Future<MovieResponse> getSimilarMoviesList(int id) async {
    var params = {
      'api_key': _apiKey,
      'language': 'en-US',
    };
    try {
      Response response = await _dio.get(_movieUrl + '$id' + '/similar',
          queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error) {
      return MovieResponse.withError(error.toString());
    }
  }

  Future<PersonDetailResponse> getDetailPerson(int personId) async {
    var params = {
      'api_key': _apiKey,
    };

    try {
      Response response = await _dio.get(_personDetailUrl + '$personId',
          queryParameters: params);
      return PersonDetailResponse.fromJson(response.data);
    } catch (error) {
      return PersonDetailResponse.withError(error.toString());
    }
  }

  Future<MovieCreditResponse> getListMoviePersonCredit(int personId) async {
    var params = {
      'api_key': _apiKey,
      'language': 'en-US',
    };

    try {
      Response response = await _dio.get(
          _personDetailUrl + '$personId' + '/movie_credits',
          queryParameters: params);
      return MovieCreditResponse.fromJson(response.data);
    } catch (error) {
      return MovieCreditResponse.withError(error.toString());
    }
  }

  Future<ReviewsResponse> getUserReviewsForMovie(int idMovie) async {
    var params = {
      'api_key': _apiKey,
      'language': 'en-US',
      'page': 1,
    };

    try {
      Response response = await _dio.get(_movieUrl + '$idMovie' + '/reviews',
          queryParameters: params);
      return ReviewsResponse.fromJson(response.data);
    } catch (error) {
      return ReviewsResponse.withError(error.toString());
    }
  }
}
