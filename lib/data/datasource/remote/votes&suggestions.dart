

import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class VotesandSuggestionsData{
  Crud crud ;

  VotesandSuggestionsData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.votesandsuggestions, {
      "id" : id });
    return response.fold((l) => l, (r) => r);
  }

  postdata(String suggestion  , String vote ,String users_id  , String place_id ) async {
    var response = await crud.postData(AppLink.addvotesandsuggestions, {
      "vote" : vote  ,
      "suggestion" : suggestion ,
      "users_id" : users_id  ,
      "place_id" : place_id ,

    });
    return response.fold((l) => l, (r) => r);
  }

}





