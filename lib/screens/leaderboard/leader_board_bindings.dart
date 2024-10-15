import 'package:get/get.dart';

import 'leader_board_controller.dart';

class LeaderBoardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaderBoardController>(() => LeaderBoardController());
  }
}
