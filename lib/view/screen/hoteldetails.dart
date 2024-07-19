import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import '../../controller/hoteldetails_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../linkapi.dart';
import '../widget/auth/custombuttonauth.dart';
import '../widget/title.dart';

class HotelDetailsScreen extends StatelessWidget {
  const HotelDetailsScreen({Key? key}) : super(key: key);




  void _showBottomSheet(BuildContext context) {
    String? selectedOption;

    showModalBottomSheet(
      context: context,
      elevation: 10,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: AppColor.primaryColor,
          width: 3.0,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      builder: (_) {
        return Container(
          child: GetBuilder<HotelDetailsControllerImp>(
            builder: (controller) => HandlingDataViewRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Add Reservation',
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
                      const SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        value: selectedOption,
                        decoration: InputDecoration(
                          hintText: 'Enter Room Type',
                          hintStyle: const TextStyle(fontSize: 14),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          label: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 9),
                            child: Text('Room Type'),
                          ),
                          suffixIcon: InkWell(child: Icon(Icons.hotel)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onChanged: (String? newValue) {
                          print('change $newValue');

                          selectedOption = newValue;
                          if (newValue != null) {
                            controller.hotelroomid.text = controller.hotelroommap[newValue] ?? ''; // Assign the selected college_id to controller.college_id

                          }

                        },
                        items: controller.roomname.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 20),
                      // Start Date Field
                      TextFormField(
                        readOnly: true,
                        showCursor: false,
                        controller: controller.startDateController,
                        decoration: InputDecoration(
                            hintText: 'Select Start Date',
                            hintStyle: const TextStyle(fontSize: 14),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            label: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 9),
                              child: Text('Start Date'),
                            ),
                            suffixIcon: InkWell(child: Icon(Icons.calendar_today)),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        onTap: () {
                          controller.startDateController.clear();
                          DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime.now(),
                            maxTime: DateTime(2025, 12, 31),
                            onChanged: (date) {
                              print('change $date');
                            },
                            onConfirm: (date) {
                              final formattedDate = DateFormat('yyyy-MM-dd').format(date);
                              controller.startDateController.text = formattedDate.toString();
                            },
                            currentTime: DateTime.now(),
                            locale: LocaleType.en,
                          );
                        },

                      ),

                      const SizedBox(height: 20),
                      TextFormField(
                        readOnly: true,
                        showCursor: false,
                        controller: controller.endDateController,
                        decoration: InputDecoration(
                          hintText: 'Select End Date',
                          hintStyle: const TextStyle(fontSize: 14),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          label: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 9),
                            child: Text('End Date'),
                          ),
                          suffixIcon: InkWell(child: Icon(Icons.calendar_today)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),

                        onTap: () {
                          controller.endDateController.clear();
                          DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime.now(),
                            maxTime: DateTime(2025, 12, 31),
                            onChanged: (date) {
                              print('change $date');
                            },
                            onConfirm: (date) {
                              final formattedDate = DateFormat('yyyy-MM-dd').format(date);
                              controller.endDateController.text = formattedDate.toString();
                            },
                            currentTime: DateTime.now(),
                            locale: LocaleType.en,
                          );
                        },
                      ),
                      const SizedBox(height: 20),


                      CustomButtomAuth(text: "Save", onPressed: () {
                        controller.addRes();
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    HotelDetailsControllerImp controller = Get.put(HotelDetailsControllerImp());

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            iconTheme: IconThemeData(color: Colors.cyan),
            pinned: true,
            backgroundColor: AppColor.primaryColor,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "${controller.hotelsmodel.hotelName}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: AppColor.clockBG,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      controller.hotelsmodel.hotelImage != null
                          ? "${AppLink.upload}${controller.hotelsmodel.hotelImage}"
                          : 'default_image_path',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TitleMain(text: "Hotel Address", image: AppImageAsset.pattern1),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 5),
                      child: Text(
                        "${controller.hotelsmodel.hotelAddress}",
                        style: TextStyle(
                          color: AppColor.bottombar,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: AppColor.cardColor,
                              offset: Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                    TitleMain(text: "About", image: AppImageAsset.pattern1),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 5),
                      child: Text(
                        "${controller.hotelsmodel.hotelDesc}",
                        style: TextStyle(
                          color: AppColor.bottombar,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: AppColor.cardColor,
                              offset: Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TitleMain(text: "Gallery", image: AppImageAsset.pattern1),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GetBuilder<HotelDetailsControllerImp>(
                            builder: (controller) {
                              if (controller.sampleImages.isNotEmpty) {
                                return FanCarouselImageSlider(
                                  imagesLink: controller.sampleImages,
                                  isAssets: false,
                                  autoPlay: true,
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    TitleMain(text: "Rooms Information", image: AppImageAsset.pattern1),
                    GetBuilder<HotelDetailsControllerImp>(
                      builder: (controller) {
                        if (controller.hotelrooms.isEmpty) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          List<DataRow> itemList = controller.hotelrooms.map((hotelroom) {
                            return DataRow(cells: [
                              DataCell(Text(hotelroom.roomType)),
                              DataCell(Text(hotelroom.roomBeds)),
                              DataCell(Text('\$${double.parse(hotelroom.roomPrice).toStringAsFixed(2)}')),
                            ]);
                          }).toList();

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[200],
                              ),
                              child: DataTable(
                                headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                                columns: const [
                                  DataColumn(
                                    label: Text('Room Type', style: TextStyle(color: AppColor.backgroundcolor, fontWeight: FontWeight.bold)),
                                  ),
                                  DataColumn(
                                    label: Text('Room Beds', style: TextStyle(color: AppColor.backgroundcolor, fontWeight: FontWeight.bold)),
                                  ),
                                  DataColumn(
                                    label: Text('Room Price', style: TextStyle(color: AppColor.backgroundcolor, fontWeight: FontWeight.bold)),
                                  ),
                                ],
                                rows: itemList,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        margin:const EdgeInsets.only(top: 10),
        child: MaterialButton(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding:const EdgeInsets.symmetric(vertical: 13),
          onPressed: () => _showBottomSheet(context),
          color: AppColor.primaryColor,
          textColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Add\nReservation' ,
                textAlign: TextAlign.center,
                style:const TextStyle(fontWeight: FontWeight.bold , fontSize: 16)),
          ),
        ),
      )
    );
  }
}
