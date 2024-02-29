
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stma/data/datasource/remote/ExploreData.dart';
import 'package:stma/data/models/places_model.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handingdatacontroller.dart';
import '../core/services/services.dart';

abstract class ExploreController extends GetxController {
  initialData();
  getdata();
  // goToItems(List categories, int selectedCat, String categoryid);
}

class ExploreControllerImp extends ExploreController {
  MyServices myServices = Get.find();

  String? id;
  StatusRequest statusRequest = StatusRequest.none;

  ExploreData exploreData = ExploreData(Get.find());

  // List data = [];
  List categories = [];
  List places = [];
  List items = [];
  // List items = [];

  @override
  initialData() {
    // myServices.sharedPreferences.clear() ;

    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    getdata();
    initialData();
    super.onInit();
  }



  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await exploreData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // Assuming response['data'] is a List of Map<String, dynamic>
        places.addAll(response['data'].map((e) => places_model.fromJson(e)).toList());

        print(places);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  // @override
  // goToItems(places, selectedplace, placesid) {
  //   Get.toNamed(AppRoute.items, arguments: {
  //     "places": places,
  //     "selectedcat": selectedplace,
  //     "catid": placesid
  //   });


  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}


