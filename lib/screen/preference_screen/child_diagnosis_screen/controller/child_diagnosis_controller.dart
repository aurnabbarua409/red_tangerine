import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/utils/app_log.dart';

class ChildDiagnosisController extends GetxController {
  final isWaiting = false.obs;
  final fromUpdate = false.obs;
  var otherTextController = TextEditingController();
  Map<String, List<String>> diagnosesByCategory = {
    "Neurodevelopmental Disorder": [
      "Autism Spectrum Disorder (ASD)",
      "Attention Deficit Hyperactivity Disorder",
      "Global Developmental Delay (GDD)",
      "Intellectual Disability",
      "Speech or Language Delay/Disorder",
      "Learning Disability",
      "Sensory Processing Disorder (SPD)",
    ],
    "Genetic & Chromosomal Condition": [
      "Down Syndrome",
      "Fragile X Syndrome",
      "Rett Syndrome",
      "Angelman Syndrome",
      "Williams Syndrome",
      "Prader-Willi Syndrome",
    ],
    "Motor & Physical Disability": [
      "Cerebral Palsy (CP)",
      "Muscular Dystrophy (e.g., Duchenne)",
      "Hypotonia (Low Muscle Tone)",
      "Spina Bifida",
    ],
    "Neurological Condition": [
      "Epilepsy / Seizure Disorder",
      "Hydrocephalus",
      "Traumatic Brain Injury (TBI)",
    ],
    "Sensory Impairment": [
      "Hearing Impairment / Deafness",
      "Vision Impairment / Blindness",
    ],
    "Other / Rare / Medical": [
      "Feeding or Swallowing Disorder",
      "Autosomal or Rare Genetic Syndrome",
      "Undiagnosed - Awaiting Evaluation",
    ],
  };
  final selectedDiagnosisType = <String>[].obs;
  final allDiagnosisType = <String>[].obs;
  final selectedDiagnosis = "".obs;

  void onIsWaiting() {
    isWaiting.value = !isWaiting.value;
  }

  void onInitital() {
    var args = Get.arguments;
    fromUpdate.value = args['fromUpdate'];
    otherTextController = TextEditingController();
  }

  void onSelectDiagnosis(String value) {
    try {
      allDiagnosisType.clear();
      selectedDiagnosisType.clear();
      selectedDiagnosis.value = value;

      appLogger(
        title: 'On selected diagnosis',
        message: selectedDiagnosis.value,
      );

      if (diagnosesByCategory.containsKey(value)) {
        allDiagnosisType.value = diagnosesByCategory[value] ?? [];
      } else {
        allDiagnosisType.clear();
      }
      appLogger(title: 'On selected diagnosis', message: allDiagnosisType);

      update();
    } catch (e) {
      appLogger(title: 'Error on selected diagnosis', message: e);
    }
  }

  void onSelectedDiagonisType(List<String> values) {
    selectedDiagnosisType.value = values;
    // appLogger(
    //   title: 'On selected diagnosis type',
    //   message: selectedDiagnosisType,
    // );
  }

  void onNext() {
    Get.toNamed(
      AppRoutes.therapySupportChildReceiveScreen,
      arguments: {'fromUpdate': false},
    );
  }

  void onUpdate() {}

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    otherTextController.dispose();
  }
}
