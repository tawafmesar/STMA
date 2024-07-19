import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stma/data/models/Hotels_model.dart';
import 'package:stma/data/models/votessuggestions_model.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/hotelsdata.dart';
import '../data/datasource/remote/votes&suggestions.dart';
import '../data/models/places_model.dart';

abstract class VotesSuggestionsController extends GetxController {}

class VotesSuggestionsControllerImp extends VotesSuggestionsController {
  late places_model placesmodel;

  String? placesid;
  StatusRequest statusRequest = StatusRequest.none;
  VotesandSuggestionsData votesandSuggestionsData = VotesandSuggestionsData(Get.find());
  HotelsData hotelsData = HotelsData(Get.find());

  List places = [];
  List votessuggestion = [];
  List hotel = [];
  late List<int> votes;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController vote;
  late TextEditingController suggestion;

  MyServices myServices = Get.find();

  String? users_id;



  int count1 = 0;
  int count2 = 0;
  int count3 = 0;
  int count4 = 0;
  int count5 = 0;
  int sum = 0;
  int count = 0;

  double average = 0;

  @override
  void onInit() {
    placesid = Get.arguments['placesid'];
    vote = TextEditingController() ;
    suggestion = TextEditingController() ;
    users_id = myServices.sharedPreferences.getString("id") ;

    getVandSdata();

    super.onInit();

    // print("placesid ...................................");
    // print(placesid);
  }

  @override
  void dispose() {
    vote.dispose();
    suggestion.dispose();
  }

  @override
  getVandSdata() async {
    statusRequest = StatusRequest.loading;
    // votessuggestion.clear();
    // votes.clear();
    update();

    var response = await votesandSuggestionsData.getData(placesid!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // Assuming response['data'] is a List of Map<String, dynamic>
        votessuggestion.addAll(response['data'].map((e) => votessuggestions_model.fromJson(e)));

        // votes =  votessuggestion.map((e) => e.vote as String).toList();

        votes = votessuggestion.map((e) => int.tryParse(e.vote ?? '') ?? 0).toList();

        print(votessuggestion);

        print("=============================== votes votes votes");

         count1 = votes.where((vote) => vote == 1).length;
         count2 = votes.where((vote) => vote == 2).length;
         count3 = votes.where((vote) => vote == 3).length;
         count4 = votes.where((vote) => vote == 4).length;
         count5 = votes.where((vote) => vote == 5).length;

         sum = votes.reduce((value, element) => value + element);
         count =votes.length;


         average = sum / count;

        print('Count of 1: $count1');
        print('Count of 2: $count2');
        print('Count of 3: $count3');
        print('Count of 4: $count4');
        print('Count of 5: $count5');



      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  @override
  Addvotessuggestions() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update() ;
      //
      // suggestion.clear();
      // vote.clear();

      var response = await votesandSuggestionsData.postdata(
          suggestion.text  , vote.text, users_id! , placesid!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.defaultDialog(
            title: "Success",
            middleText: "The Votes & Suggestions have been added successfully.",
            onConfirm: () {
              suggestion.clear();
              vote.clear();


              Get.toNamed("votesSuggestions", arguments: {"placesid": placesid});

            },
          );

        } else {
          Get.defaultDialog(title: "Notification" , middleText: "The are an arror") ;
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {

    }
  }





}