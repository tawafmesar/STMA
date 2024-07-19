import 'package:get/get.dart';
import 'package:stma/data/models/Hotels_model.dart';
import 'package:stma/data/models/placeimage_model.dart';
import 'package:stma/data/models/votessuggestions_model.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handingdatacontroller.dart';
import '../data/datasource/remote/hotelsdata.dart';
import '../data/datasource/remote/imagedata.dart';
import '../data/datasource/remote/votes&suggestions.dart';
import '../data/models/places_model.dart';
import '../linkapi.dart';

abstract class HotelsController extends GetxController {}

class HotelsControllerImp extends HotelsController {


  String? placesid;
  StatusRequest statusRequest = StatusRequest.none;
  ImagesData imagesData = ImagesData(Get.find());
  HotelsData hotelsData = HotelsData(Get.find());

  List places = [];
  List placeimage = [];
  late List<String> sampleImages = [];
  late  List hotel = [];





  @override
  void onInit() {
    placesid = Get.arguments['placesid'];
    getHotelsdata();
    super.onInit();

    // print("placesid ...................................");
    // print(placesid);
  }



  @override
  getHotelsdata() async {
    statusRequest = StatusRequest.loading;
    var response = await hotelsData.getData(placesid!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // Assuming response['data'] is a List of Map<String, dynamic>
        hotel.addAll(response['data'].map((e) => hotels_model.fromJson(e)).toList());

        print(hotel);

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }



  goToPageProductDetails(int index) {
    Get.toNamed("hotelDetailsScreen", arguments: {"hotelsmodel": hotel[index]});
  }

}