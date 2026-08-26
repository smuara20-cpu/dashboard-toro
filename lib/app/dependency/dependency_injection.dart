import 'register_controller.dart';
import 'register_datasource.dart';
import 'register_mapper.dart';
import 'register_repository.dart';
import 'register_service.dart';
import 'register_usecase.dart';

Future<void> initializeDependency() async {
  registerService();

  registerMappers();

  registerDatasource();

  registerRepositories();

  registerUsecase();

  registerController();
}