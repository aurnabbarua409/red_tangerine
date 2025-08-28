import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/utils/app_log.dart';

class TherapySupportController extends GetxController {
  final isWaiting = false.obs;
  final fromUpdate = false.obs;
  final Map<String, List<String>> therapyByCategory = {
    'Developmental & Behavioral': [
      'Applied Behavior Analysis (ABA)',
      'Occupational Therapy (OT)',
      'Speech Therapy / Language Therapy',
      'Feeding Therapy',
      'Social Skills Group',
      'Floortime / DIR',
    ],
    'Physical & Sensory': [
      'Physical Therapy (PT)',
      'Sensory Integration Therapy',
      'Hippotherapy',
      'Aquatic Therapy',
    ],
    'Family & Educational Support': [
      'Special Education / IEP Support',
      'Developmental Pediatrician',
      'Case Management / Regional Center',
      'Parent Support Groups',
      'Counseling / Family Therapy',
    ],
  };
  final selectedTherapy = "".obs;
  final allTherapyType = <String>[].obs;
  final selectedTherapyType = <String>[].obs;

  void onInitital() {
    var args = Get.arguments;
    fromUpdate.value = args['fromUpdate'];
  }

  void onIsWaiting() {
    isWaiting.value = !isWaiting.value;
  }

  void onSelectTherapy(String value) {
    try {
      allTherapyType.clear();
      selectedTherapyType.clear();
      selectedTherapy.value = value;

      appLogger(title: 'On selected therapy', message: selectedTherapy.value);

      if (therapyByCategory.containsKey(value)) {
        allTherapyType.value = therapyByCategory[value] ?? [];
      } else {
        allTherapyType.clear();
      }
      appLogger(title: 'On selected therapy', message: allTherapyType);

      update();
    } catch (e) {
      appLogger(title: 'Error on selected therapy', message: e);
    }
  }

  void onNext() {
    Get.toNamed(
      AppRoutes.whereParentingJourneyScreen,
      arguments: {'fromUpdate': false},
    );
  }

  void onUpdate() {}
}
