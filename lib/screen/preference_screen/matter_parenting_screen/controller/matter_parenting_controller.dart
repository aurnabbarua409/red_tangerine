import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/utils/app_log.dart';

class MatterParentingController extends GetxController {
  final List interests = [
    'Nature walks 🌲',
    'Outdoor play / playgrounds 🛝',
    'Sensory or hands-on play 🖐️',
    'Reading books 📚',
    'Building routines / schedules 📅',
    'Music 🎵',
    'Traveling ✈️',
    'Pretend play / dress up 🎭',
    'Screen-free activities 📵',
    'Arts & Crafts 🎨',
  ];
  RxList selectedInterests = [].obs;
  RxList<bool> isSelectedInterest = <bool>[].obs;

  final fromUpdate = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isSelectedInterest.value = List.generate(
      interests.length,
      (index) => false,
    );
  }

  void onInitital() {
    var args = Get.arguments;
    fromUpdate.value = args['fromUpdate'];
  }

  void onSelectedInterest(int id) {
    try {
      if (selectedInterests.contains(interests[id])) {
        selectedInterests.remove(interests[id]);
        isSelectedInterest[id] = false;
        isSelectedInterest.refresh();
        update();
        appLogger(
          title: 'Removed Interest',
          message: selectedInterests.toString(),
        );
        return;
      }
      selectedInterests.add(interests[id]);
      isSelectedInterest[id] = true;
      isSelectedInterest.refresh();
      update();
      appLogger(
        title: 'Selected Interest',
        message: selectedInterests.toString(),
      );
    } catch (e) {
      appLogger(title: 'Error in what enjoy as parent', message: e.toString());
    }
  }

  void onNext() {
    Get.toNamed(
      AppRoutes.addProfilePictureScreen,
      arguments: {'fromUpdate': false},
    );
  }

  void onUpdate() {
    Get.back();
  }
}
