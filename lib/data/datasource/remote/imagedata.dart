import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class ImagesData{
  Crud crud ;

  ImagesData(this.crud);


  getPlaceImagesData(String id) async {
    var response = await crud.postData(AppLink.placeimage, {
      "id" : id });
    return response.fold((l) => l, (r) => r);
  }

  getHotelImagesData(String id) async {
    var response = await crud.postData(AppLink.hotelimage, {
      "id" : id });
    return response.fold((l) => l, (r) => r);
  }

}