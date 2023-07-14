import 'package:get/get.dart';
import 'package:gettest/application/controllers/checkuserdatacontroller.dart';
import 'package:gettest/home/controllers/homepagecontroller.dart';

class InitDep implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserInformationController(), fenix: true);  
    Get.lazyPut(() => MyhomepageContoller, fenix: true);


    // TODO: implement dependencies
  }
}
