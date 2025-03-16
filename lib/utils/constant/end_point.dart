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
  static const addToCart = '$baseUrl/User/HFAddToCart';
  static const checkoutPayment = '$baseUrl/User/HFCheckoutPayment';
  static const updatePaymentTransaction = '$baseUrl/User/HFUpdatePaymentTransaction';
  static const hFCheckDeliveryAvailable = '$baseUrl/User/HFCheckDeliveryAvailable';
  
  
}
