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

abstract class PlaceDetailsController extends GetxController {}

class PlaceDetailsControllerImp extends PlaceDetailsController {
  late places_model placesmodel;

  String? placesid;
  StatusRequest statusRequest = StatusRequest.none;
  VotesandSuggestionsData votesandSuggestionsData = VotesandSuggestionsData(Get.find());
  ImagesData imagesData = ImagesData(Get.find());
  HotelsData hotelsData = HotelsData(Get.find());

  List places = [];
  List placeimage = [];
  late List<String> sampleImages = [];
  List votessuggestion = [];
  List hotel = [];




  intialData() {
    placesmodel = Get.arguments['placesmodel'];
  }

  List subitems = [
    {"getPlaceImagesData": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  @override
  void onInit() {
    intialData();
    placesid = placesmodel.placeId;
    // getHotelsdata();
    getVandSdata();
    getplaceimagedata();
    super.onInit();

    // print("placesid ...................................");
    // print(placesid);
  }

  @override
  getplaceimagedata() async {
    statusRequest = StatusRequest.loading;
    var response = await imagesData.getPlaceImagesData(placesid!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // Assuming response['data'] is a List of Map<String, dynamic>
        // placeimage.addAll(response['data'].map((e) => placeimage_model.fromJson(e)).toList());
      placeimage.addAll(response['data'].map((e) => placeimage_model.fromJson(e)));

    print('placeimage..................................................................');

        print(placeimage);

        // sampleImages =  placeimage.map((e) => e.placeimagesPath as String).toList();
        sampleImages = placeimage.map((e) => "${AppLink.upload}${e.placeimagesPath}").toList();

      // for (var courseFile in placeimage) {
        //   print('File ID: ${courseFile.placeId}');
        //   print('File Name: ${courseFile.placeimagesId}');
        //   print('File Path: ${courseFile.placeimagesPath}');
        //
        //   print(" ...........................");
        //
        // }
      print('sampleImages..................................................................');

      print(sampleImages);

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  @override
  getVandSdata() async {
    statusRequest = StatusRequest.loading;
    var response = await votesandSuggestionsData.getData(placesid!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // Assuming response['data'] is a List of Map<String, dynamic>
        votessuggestion.addAll(response['data'].map((e) => votessuggestions_model.fromJson(e)).toList());

        print(votessuggestion);

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
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

  gotohotels(){
    try {

      Get.toNamed("hotelsScreen", arguments: {"placesid": placesid});

    } catch (e) {
      print('Error downloading file: $e');
      // Handle the error here
    }
  }
  gotovotesSuggestions(){
    try {

      Get.toNamed("votesSuggestions", arguments: {"placesid": placesid});

    } catch (e) {
      print('Error downloading file: $e');
      // Handle the error here
    }
  }

}