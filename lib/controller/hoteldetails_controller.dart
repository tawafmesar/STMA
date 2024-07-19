import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stma/data/models/Hotels_model.dart';
import 'package:stma/data/models/hotelimage_model.dart';
import 'package:stma/data/models/hotelroom_model.dart';
import 'package:stma/data/models/placeimage_model.dart';
import 'package:stma/data/models/votessuggestions_model.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/hotelsdata.dart';
import '../data/datasource/remote/imagedata.dart';
import '../data/datasource/remote/votes&suggestions.dart';
import '../data/models/places_model.dart';
import '../linkapi.dart';

abstract class HotelDetailsController extends GetxController {}

class HotelDetailsControllerImp extends HotelDetailsController {
  late hotels_model  hotelsmodel;

  String? hotelid;
  String? userid;

  StatusRequest statusRequest = StatusRequest.none;
  VotesandSuggestionsData votesandSuggestionsData = VotesandSuggestionsData(Get.find());
  ImagesData imagesData = ImagesData(Get.find());
  HotelsData hotelsData = HotelsData(Get.find());

  List places = [];
  List hotelimage = [];
  late List<String> sampleImages = [];
  List votessuggestion = [];
  List hotel = [];


  List hotelrooms = [];

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController startDateController;
  late TextEditingController endDateController;
  late TextEditingController hotelroomid;

  MyServices myServices = Get.find();


  intialData() {
    hotelsmodel = Get.arguments['hotelsmodel'];
  }



  @override
  void onInit() {
    intialData();
    hotelid = hotelsmodel.hotelId;
    startDateController = TextEditingController() ;
    endDateController = TextEditingController() ;
    hotelroomid = TextEditingController() ;
    userid = myServices.sharedPreferences.getString("id") ;




    gethotelimagedata();
    getHotelRoomsdata();
    super.onInit();

    // print("placesid ...................................");
    // print(placesid);
  }



  @override
  void dispose() {
    startDateController.dispose();
    endDateController.dispose();
    hotelroomid.dispose();


    super.dispose();
  }


  @override
  gethotelimagedata() async {
    statusRequest = StatusRequest.loading;
    var response = await imagesData.getHotelImagesData(hotelid!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // Assuming response['data'] is a List of Map<String, dynamic>
        // placeimage.addAll(response['data'].map((e) => placeimage_model.fromJson(e)).toList());
        hotelimage.addAll(response['data'].map((e) => hotelimage_model.fromJson(e)));

        print('hotelimage..................................................................');

        print(hotelimage);

        // sampleImages =  placeimage.map((e) => e.placeimagesPath as String).toList();
        sampleImages = hotelimage.map((e) => "${AppLink.upload}${e.hotelimagesPath}").toList();

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

  List<String> roomname = [];


  Map<String, String> hotelroommap = {};

  getHotelRoomsdata() async {
    statusRequest = StatusRequest.loading;
    var response = await hotelsData.getHotelRoomsData(hotelid!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // Assuming response['data'] is a List of Map<String, dynamic>
        hotelrooms.addAll(response['data'].map((e) => hotelroom_model.fromJson(e)).toList());

        List<dynamic> responsedata = response['data'];

        for (var item in responsedata) {
          String room_id = item['room_id'];
          String room_name = item['room_type'] + ', ' + item['room_beds'].toString();
          roomname.add(room_name);

          hotelroommap[room_name] = room_id;

        }
        print('hotelroommap /////////////////////////////////////////////////');

        print(hotelroommap);

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  addRes() async {
    print('test .................');

    print(startDateController.text);
    print('test .................');

    print(endDateController.text);
    print('test .................');

    print(hotelroomid.text);
    print('test .................');

    print(userid);


    String test1 ='2024-03-08';
    String test2 ='2024-03-08';
    String test3 ='64';
    String test4 ='2';

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update() ;
      var response = await hotelsData.addRegdata(
          startDateController.text, endDateController.text, userid!, hotelroomid.text);

      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          startDateController.clear();
          endDateController.clear();
          hotelroomid.clear();
          Get.defaultDialog(
              title: "Success" , middleText: "Success Save Reservation");

        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {

    }
  }



}