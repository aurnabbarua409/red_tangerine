import 'package:get/get.dart';
import 'package:red_tangerine/model/notification_model.dart';

class NotificationController extends GetxController {
  final intervals = ['Monthly', 'Weekly', 'Daily'];
  final selectedInterval = "".obs;
  final notificationList = <NotificationModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    notificationList.value = [
      NotificationModel(
        name: 'Samuel,32',
        distance: "2 Miles",
        childAge: 12,
        diagnosis: "Neurodevelopmental Disorder",
        unseen: true,
      ),
      NotificationModel(
        name: 'Samuel,32',
        distance: "2 Miles",
        childAge: 12,
        diagnosis: "Neurodevelopmental Disorder",
        unseen: false,
      ),
      NotificationModel(
        name: 'Samuel,32',
        distance: "2 Miles",
        childAge: 12,
        diagnosis: "Neurodevelopmental Disorder",
        unseen: false,
      ),
    ];
  }

  void setIntervals(String value) {
    selectedInterval.value = value;
  }
}
