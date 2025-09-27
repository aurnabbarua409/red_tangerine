import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/utils/app_log.dart';

class ChildJourneyController extends GetxController {
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

  final List valuesLifeStyle = [
    'Learning as we go 🔍',
    'Gentle parenting 💞',
    'Structured routines 📋',
    'Faith or spirituality 🕊️',
    'Value community & friendship 🤝',
    'Always researching 📖 ',
  ];
  RxList selectedValuesLifeStyle = [].obs;
  RxList<bool> isSelectedValuesLifeStyle = <bool>[].obs;
  final fromUpdate = false.obs;
  final isWaiting = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isSelectedInterest.value = List.generate(
      interests.length,
      (index) => false,
    );
    isSelectedValuesLifeStyle.value = List.generate(
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

  void onSelectedValuesLifeStyle(int id) {
    try {
      if (selectedValuesLifeStyle.contains(valuesLifeStyle[id])) {
        selectedValuesLifeStyle.remove(valuesLifeStyle[id]);
        isSelectedValuesLifeStyle[id] = false;
        isSelectedValuesLifeStyle.refresh();
        update();
        appLogger(
          title: 'Removed Interest',
          message: selectedValuesLifeStyle.toString(),
        );
        return;
      }
      selectedValuesLifeStyle.add(valuesLifeStyle[id]);
      isSelectedValuesLifeStyle[id] = true;
      isSelectedValuesLifeStyle.refresh();
      update();
      appLogger(
        title: 'Selected Interest',
        message: selectedValuesLifeStyle.toString(),
      );
    } catch (e) {
      appLogger(title: 'Error in what enjoy as parent', message: e.toString());
    }
  }

  void onNext() {
    Get.toNamed(
      AppRoutes.supportDifferenceScreen,
      arguments: {'fromUpdate': false},
    );
  }

  void onClickIsWaiting() {
    isWaiting.value = !isWaiting.value;
    update();
  }

  void onUpdate() {
    Get.back();
  }
}
