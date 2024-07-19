import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rating_summary/rating_summary.dart';
import 'package:stma/view/widget/stardisplay.dart';
import 'package:we_slide/we_slide.dart';

import '../../controller/placedetails_controller.dart';
import '../../controller/votesSuggestions_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../../core/functions/validinput.dart';
import '../widget/auth/custombuttonauth.dart';
import '../widget/auth/customtextbodyauth.dart';
import '../widget/auth/customtextformauth.dart';
import '../widget/auth/customtexttitleauth.dart';

class VotesSuggestionsScreen extends StatelessWidget {
  const VotesSuggestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VotesSuggestionsControllerImp());
    final _colorScheme = Theme.of(context).colorScheme;
    final double _panelMinSize = 70.0;
    final double _panelMaxSize = MediaQuery.of(context).size.height / 2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 6,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Handle back button press
        ),
        title: Text("Smart Assistant",
            style:TextStyle(color:Colors.white,fontSize: 20, fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: AppColor.clockBG,
                  offset: Offset(2, 2),
                  blurRadius: 4,
                ),
              ],)),
      ),
      body: WeSlide(
        panelMinSize: _panelMinSize,
        panelMaxSize: _panelMaxSize,
        backgroundColor: Colors.white,
        body: GetBuilder<VotesSuggestionsControllerImp>(builder: ((controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                Center(
                  child: RatingSummary(
                    counter: controller.count,
                    average: controller.average,
                    showAverage: true,
                    counterFiveStars: controller.count5,
                    counterFourStars: controller.count4,
                    counterThreeStars: controller.count3,
                    counterTwoStars: controller.count2,
                    counterOneStars: controller.count1,
                  ),
                ),
                ...List.generate(
                    controller.votessuggestion.length,
                        (index) => Container(
                      margin: const EdgeInsets.all(10), // Add margin as needed
                      child: Material(
                        elevation: 10,
                        shape:const RoundedRectangleBorder(
                          side: BorderSide(
                            color: AppColor.primaryColor, // Border color
                            width: 3.0, // Border width
                          ),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomRight: Radius.circular(25)), // Border radius
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Material(
                              borderRadius:const BorderRadius.only(
                                  topLeft: Radius.circular(25)),
                              color: AppColor.primaryTextColor,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Image.asset(

                                      'assets/images/logo.png',
                                      height: 30,
                                      width: 30,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child:
                                      Text("${controller.votessuggestion[index].suggestion}"
                                        ,style: TextStyle(
                                          color:  Colors.black54,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Container(
                              decoration:const BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(25))
                              ),
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 30,
                                        child:const Center(
                                          child: Icon(
                                            FontAwesomeIcons.user,
                                            color: AppColor.scaffoldBackgroundColor,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        child:  Center(
                                          child: Text('   ${controller.votessuggestion[index].usersId}',style: TextStyle(color: AppColor.scaffoldBackgroundColor),),
                                        ),
                                      ),
                                      SizedBox(width: 10,),

                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        height: 30,
                                        child:const Center(
                                          child: Icon(
                                            FontAwesomeIcons.calendar,
                                            color: AppColor.scaffoldBackgroundColor,
                                          ),
                                        ),
                                      )
                                      ,  Container(
                                        height: 32,
                                        child:  Center(
                                          child: StarDisplay(value: int.parse(controller.votessuggestion[index].vote)),
                                        ),
                                      ),
                                      SizedBox(width: 10,),

                                    ],
                                  )
                                  ,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                )
              ],
            )
        )
        ),),
        panel:
        Container(
            color: _colorScheme.background,
          child: GetBuilder<VotesSuggestionsControllerImp>(
              builder:
                  (controller) =>

                  HandlingDataViewRequest(statusRequest: controller.statusRequest,
                      widget:
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(children: [
                            const SizedBox(height: 10),
                            Expanded(

                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Add Vote and Suggestions',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.splsh,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black.withOpacity(0.5),
                                        offset: Offset(5.0, 5.0),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),

                            Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                  controller.vote.text = rating.round().toString();

                                },
                              ),
                            ),
                          ),
                            const SizedBox(height: 20),

                            CustonTextFormAuth(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 3, 100, "suggestion");
                              },
                              mycontroller: controller.suggestion,
                              hinttext: "Enter Suggestion",
                              iconData: Icons.person_outline,
                              labeltext: "Suggestion",

                              // mycontroller: ,
                            ),


                            CustomButtomAuth(text: "Save", onPressed: () {
                              controller.Addvotessuggestions();
                            }),

                          ]),
                        ),
                      )
                  )),
        ),
        panelHeader: Container(
          height: _panelMinSize,
          color: _colorScheme.secondary,
          child: Center(child: Text("Add New☝️")),
        ),
      )
    );

  }
}

