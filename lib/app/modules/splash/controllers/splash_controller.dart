import 'package:get/get.dart';

import '../../../data/app_assets.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  String applogo=AppAssets.appLogo;

  @override
  void onInit() {
    Future.delayed(Duration(seconds: 3), ()=> Get.offNamed(Routes.LOGIN));
    super.onInit();
  }

}
