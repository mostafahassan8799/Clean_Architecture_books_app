import 'package:bookly/Features/home/data/data_sources/local/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;
void setupServiceLocator() {
  serviceLocator.registerSingleton<ApiService>(ApiService(Dio()));

  serviceLocator.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
          apiService: serviceLocator.get<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImpl()));
}
