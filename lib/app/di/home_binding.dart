import 'package:communere/app/network/network_client.dart';
import 'package:communere/data/data_source/remote/photos_remote_data_source.dart';
import 'package:communere/data/repository/photo_repository_impl.dart';
import 'package:communere/domain/data_source/photo_data_source.dart';
import 'package:communere/domain/repository/photos_repository.dart';
import 'package:communere/domain/usecase/photo/photo_usecase.dart';
import 'package:communere/presentation/home/home_view_model.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewModel>(() => HomeViewModel(Get.find<PhotoUseCase>()),
        fenix: true);

    Get.lazyPut<PhotoUseCase>(
        () => PhotoUseCaseImpl(Get.find<PhotosRepository>()),
        fenix: true);
    Get.lazyPut<PhotosRepository>(
        () => PhotosRepositoryImpl(Get.find<PhotosDataSource>()),
        fenix: true);
    Get.lazyPut<PhotosDataSource>(
        () => PhotosRemoteDataSource(Get.find<NetworkClient>()),
        fenix: true);
  }
}
