import 'package:get/get.dart';
import 'package:whatsignisthis/screens/play/game_play_controller.dart';

class GamePlayBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GamePlayController>(() => GamePlayController());
  }
}
