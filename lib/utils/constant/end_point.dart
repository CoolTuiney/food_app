abstract class EndPoint {
  ///----------------------------------------------------------///
  ///                      HOSTS                               ///
  ///----------------------------------------------------------///

  static const baseUrl = 'https://uatapi.homeleyfood.com';

  ///----------------------------------------------------------///
  ///                      END POINTS                          ///
  ///----------------------------------------------------------///

  static const sendOTP = '$baseUrl/User/HFSendOTP';
  static const verifydOTP = '$baseUrl/User/HFVerifyOTP';
  static const foodListing = '$baseUrl/User/HFGetFoodListing';
}
