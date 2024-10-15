import 'package:get/get.dart';
import 'package:whatsignisthis/screens/gameover/game_over_controller.dart';

class GameOverBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameOverController>(() => GameOverController());
  }
}
