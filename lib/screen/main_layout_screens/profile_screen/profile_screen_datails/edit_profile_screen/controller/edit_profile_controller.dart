import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  var firstNameController = TextEditingController();
  var lastnameController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void onUpdate(){
    
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    firstNameController.dispose();
    lastnameController.dispose();
    dateOfBirthController.dispose();
    emailController.dispose();
  }
}
