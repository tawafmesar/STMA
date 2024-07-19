

import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class HotelsData{
  Crud crud ;

  HotelsData(this.crud);


  getData(String id) async {
    var response = await crud.postData(AppLink.hotels, {
      "id" : id });
    return response.fold((l) => l, (r) => r);
  }

  getHotelRoomsData(String id) async {
    var response = await crud.postData(AppLink.hotelsrooms, {
      "id" : id });
    return response.fold((l) => l, (r) => r);
  }


  addRegdata(String satrt_date ,String end_date ,String user_id ,String room_id ) async {
    var response = await crud.postData(AppLink.addreservation, {
      "satrt_date" : satrt_date ,
      "end_date" : end_date  ,
      "user_id" : user_id ,
      "room_id" : room_id  ,
    });
    return response.fold((l) => l, (r) => r);
  }

}