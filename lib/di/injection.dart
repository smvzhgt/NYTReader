import 'package:get_it/get_it.dart';
import 'package:nyt_news/core/api_client/api_client.dart';
import 'package:nyt_news/core/db/db_client.dart';
import 'package:nyt_news/src/scenes/favorite/data/datasources/favorite_local_data_source.dart';
import 'package:nyt_news/src/scenes/favorite/data/repositories/favorite_repository.dart';
import 'package:nyt_news/src/scenes/favorite/domain/interactor/favorite_interactor.dart';
import 'package:nyt_news/src/scenes/favorite/domain/repository/favorite_repository.dart';
import 'package:nyt_news/src/scenes/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:nyt_news/src/scenes/most_emailed/data/datasources/emailed_local_data_source.dart';
import 'package:nyt_news/src/scenes/most_emailed/data/datasources/emailed_remote_data_source.dart';
import 'package:nyt_news/src/scenes/most_emailed/data/repositories/emailed_repository.dart';
import 'package:nyt_news/src/scenes/most_emailed/domain/interactor/emailed_interactor.dart';
import 'package:nyt_news/src/scenes/most_emailed/domain/repository/emailed_repository.dart';
import 'package:nyt_news/src/scenes/most_emailed/presentation/bloc/emailed_bloc.dart';
import 'package:nyt_news/src/scenes/most_shared/data/datasources/shared_local_data_source.dart';
import 'package:nyt_news/src/scenes/most_shared/data/datasources/shared_remote_data_source.dart';
import 'package:nyt_news/src/scenes/most_shared/data/repositories/shared_repository.dart';
import 'package:nyt_news/src/scenes/most_shared/domain/interactor/shared_interactor.dart';
import 'package:nyt_news/src/scenes/most_shared/domain/repository/shared_repository.dart';
import 'package:nyt_news/src/scenes/most_shared/presentation/bloc/shared_bloc.dart';
import 'package:nyt_news/src/scenes/most_viewed/data/datasources/viewed_local_data_source.dart';
import 'package:nyt_news/src/scenes/most_viewed/data/datasources/viewed_remote_data_source.dart';
import 'package:nyt_news/src/scenes/most_viewed/data/repositories/viewed_repository.dart';
import 'package:nyt_news/src/scenes/most_viewed/domain/interactor/viewed_interactor.dart';
import 'package:nyt_news/src/scenes/most_viewed/domain/repository/viewed_repository.dart';
import 'package:nyt_news/src/scenes/most_viewed/presentation/bloc/viewed_bloc.dart';

final sl = GetIt.instance;

void init() {
  // Most Emailed

  // Bloc
  sl.registerFactory(() => EmailedBloc(EmailedInitialState(), sl()));
  // Interactor
  sl.registerLazySingleton<EmailedInteractor>(
    () => EmailedInteractorImpl(repository: sl()),
  );
  // Repository
  sl.registerLazySingleton<EmailedRepository>(
    () => EmailedRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()),
  );
  // RemoteDataSource
  sl.registerLazySingleton<EmailedRemoteDataSource>(
    () => EmailedRemoteDataSourceImpl(apiClient: sl()),
  );
  // LocalDataSource
  sl.registerLazySingleton<EmailedLocalDataSource>(
    () => EmailedLocalDataSourceImpl(dbClient: sl()),
  );

  // Most Shared

  // Bloc
  sl.registerFactory(
    () => SharedBloc(SharedInitialState(), sl()),
  );
  // Interactor
  sl.registerLazySingleton<SharedInteractor>(
    () => SharedInteractorImpl(repository: sl()),
  );
  // Repository
  sl.registerLazySingleton<SharedRepository>(
    () => SharedRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()),
  );
  // RemoteDataSource
  sl.registerLazySingleton<SharedRemoteDataSource>(
    () => SharedRemoteDataSourceImpl(apiClient: sl()),
  );
  // LocalDataSource
  sl.registerLazySingleton<SharedLocalDataSource>(
    () => SharedLocalDataSourceImpl(dbClient: sl()),
  );

  // Most Viewed

  // Bloc
  sl.registerFactory(
    () => ViewedBloc(ViewedInitialState(), sl()),
  );
  // Interactor
  sl.registerLazySingleton<ViewedInteractor>(
    () => ViewedInteractorImpl(repository: sl()),
  );
  // Repository
  sl.registerLazySingleton<ViewedRepository>(
    () => ViewedRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()),
  );
  // RemoteDataSource
  sl.registerLazySingleton<ViewedRemoteDataSource>(
    () => ViewedRemoteDataSourceImpl(apiClient: sl()),
  );
  // LocalDataSource
  sl.registerLazySingleton<ViewedLocalDataSource>(
    () => ViewedLocalDataSourceImpl(dbClient: sl()),
  );

  // Favorite

  // Bloc
  sl.registerFactory(
    () => FavoriteBloc(FavoriteInitialState(), sl()),
  );
  // Interactor
  sl.registerLazySingleton<FavoriteInteractor>(
    () => FavoriteInteractorImpl(repository: sl()),
  );
  // Repository
  sl.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(localDataSource: sl()),
  );
  // LocalDataSource
  sl.registerLazySingleton<FavoriteLocalDataSource>(
    () => FavoriteLocalDataSourceImpl(dbClient: sl()),
  );
  // DBClient
  sl.registerSingleton(DBClient.dbClient);
  // ApiClient
  sl.registerLazySingleton<ApiClient>(
    () => ApiClientImpl(),
  );
}
