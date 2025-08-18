import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';

class ChildDiagnosisController extends GetxController {
  final isWaiting = false.obs;
  Map<String, List<String>> diagnosesByCategory = {
    "Neurodevelopmental Disorder": [
      "Autism Spectrum Disorder (ASD)",
      "Attention Deficit Hyperactivity Disorder (ADHD)",
      "Global Developmental Delay (GDD)",
      "Intellectual Disability",
      "Speech or Language Delay/Disorder",
      "Learning Disability (e.g., Dyslexia, Dysgraphia)",
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
      "Autosomal or Rare Genetic Syndrome (unspecified)",
      "Undiagnosed - Awaiting Evaluation",
    ],
  };

  void onIsWaiting() {
    isWaiting.value = !isWaiting.value;
  }

  void onNext() {
    Get.toNamed(AppRoutes.therapySupportChildReceiveScreen);
  }
}
