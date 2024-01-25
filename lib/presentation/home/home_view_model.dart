import 'package:communere/app/base/base_controller.dart';
import 'package:communere/domain/usecase/photo/photo_usecase.dart';

class HomeViewModel extends BaseController{
  final PhotoUseCase _photoUseCase;
  HomeViewModel(this._photoUseCase);


}