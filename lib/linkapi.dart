class AppLink {

  static const String server = "https://axonometric-buildin.000webhostapp.com/";
  static const String upload = "$server/upload/";

//
  static const String test = "$server/test.php";

// ================================= Auth ========================== //

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String resend = "$server/auth/resend.php";

  static const String verifycodessignup = "$server/auth/verfiycode.php";

// ================================= ForgetPassword ========================== //

  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword = "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword = "$server/forgetpassword/verifycode.php";

  static const String homepage = "$server/home.php"  ;

  static const String hotels = "$server/hotels/view.php"  ;
  static const String hotelsrooms = "$server/hotels/viewrooms.php"  ;
  static const String addreservation = "$server/hotels/addreservation.php"  ;

  static const String hotelimage = "$server/hotels/viewimage.php"  ;
  static const String placeimage = "$server/places/viewimage.php"  ;


  static const String votesandsuggestions = "$server/votessuggestions/view.php"  ;
  static const String addvotesandsuggestions = "$server/votessuggestions/add.php"  ;


}
