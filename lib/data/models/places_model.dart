class places_model {
  String? placeId;
  String? placeName;
  String? placesAddress;
  String? placeImg;

  places_model(
      {this.placeId, this.placeName, this.placesAddress, this.placeImg});

  places_model.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'];
    placeName = json['place_name'];
    placesAddress = json['places_address'];
    placeImg = json['place_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place_id'] = this.placeId;
    data['place_name'] = this.placeName;
    data['places_address'] = this.placesAddress;
    data['place_img'] = this.placeImg;
    return data;
  }
}