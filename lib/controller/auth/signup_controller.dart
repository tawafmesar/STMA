import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/auth/signup.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}


class SignUpControllerImp extends SignUpController {
GlobalKey<FormState> formstate = GlobalKey<FormState>();

late TextEditingController username;
late TextEditingController email;
late TextEditingController phone;
late TextEditingController password;

StatusRequest statusRequest = StatusRequest.none;

SignupData signupData = SignupData(Get.find());

List data = [];


@override
signUp() async {
  if (formstate.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update() ;
    var response = await signupData.postdata(
        username.text, password.text, email.text, phone.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(AppRoute.verfiyCodeSignUp  ,arguments: {
          "email" : email.text
        });
      } else {
        Get.defaultDialog(title: "تنبيــة" , middleText: "يرجى التأكد , البريد الألكتروني او رقم الهاتف موجود مسبقاً") ;
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  } else {

  }
}


  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController() ;
    phone = TextEditingController() ;
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}