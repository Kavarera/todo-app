import 'package:get/get.dart';

class floatActionButtonController extends GetxController {
  var clicked = 0.obs;

  void testing() => clicked++;
  void decrement() => clicked--;
}
