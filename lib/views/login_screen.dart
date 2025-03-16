import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/common/common_widget.dart';
import 'package:food_app/providers/login_controller.dart';
import 'package:food_app/service/networking/api_requests.dart';
import 'package:food_app/service/networking/api_service.dart';
import 'package:food_app/service/shared_pref.dart';
import 'package:food_app/utils/constant/color_constants.dart';
import 'package:food_app/utils/custom_text.dart';
import 'package:food_app/utils/extensions.dart';
import 'package:food_app/utils/stylish_toast.dart';
import 'package:food_app/views/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../utils/constant/end_point.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/icons/bg_login_screen.png",
              height: size.height,
              width: size.width,
              fit: BoxFit.fill,
            ),
            Container(
              height: size.height,
              width: size.width,
              decoration:
                  BoxDecoration(gradient: ColorConstant.loginBgLinearGradient),
            ),
            CustomText.richText(textSpans: [
              TextSpan(
                  text: "Welcome to",
                  style: CustomText.textStyle(
                      size: 45, color: Colors.black, bold: true)),
              TextSpan(
                  text: "\ Homely Food",
                  style: CustomText.textStyle(
                      size: 45, color: ColorConstant.primaryColor, bold: true)),
              TextSpan(
                  text:
                      "\n\nYour favourite home-cooked meals delivered\n to your doorstep!",
                  style: CustomText.textStyle(
                      size: 14, color: const Color(0xFF30384F), bold: true)),
            ]).padOnly(t: 170, l: 35, r: 35),
            Positioned(
              bottom: 0,
              left: 25,
              right: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          height: 2,
                          color: Colors.white38,
                        ),
                      ),
                      CustomText.title(
                              text: "LOGIN",
                              size: 16,
                              color: Colors.white,
                              isBold: true)
                          .padSymm(horizontal: 30),
                      const Expanded(
                        child: Divider(
                          height: 4,
                          color: Colors.white38,
                        ),
                      ),
                    ],
                  ).padOnly(b: 40),
                  CommonWidget.customTextFieldWithLabel(
                          "Mobile No.", "Enter Mobile No.",
                          keyboardType: TextInputType.phone,
                          labelColor: Colors.white,
                          controller: loginController.mobileTFController)
                      .padOnly(b: 40),
                  Center(
                    child: CommonWidget.roundedButton(
                        context: context,
                        title: "Get OTP",
                        onTap: () async {
                          if (await loginController.sendOTP()) {
                            showOTPBottomsheet(context);
                          }
                        }),
                  )
                ],
              ).padOnly(b: 100),
            ),
          ],
        ),
      ),
    );
  }

  startRazerPay() {
    Razorpay razorpay = Razorpay();
    var options = {
      'key': 'rzp_live_ILgsfZCZoFIKMb',
      'amount': 100,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
    razorpay.open(options);
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    // showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    // showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    // showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
  }

  showOTPBottomsheet(BuildContext context) {
    final loginController = Get.find<LoginController>();
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = ColorConstant.primaryColor;

    final defaultPinTheme = PinTheme(
      width: 58.h,
      height: 58.h,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.r))),
        builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SizedBox(
                height: 400,
                child: Column(
                  children: [
                    Container(
                      height: 5.h,
                      width: 50.h,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(10.r)),
                    ),
                    Center(
                            child: CustomText.title(
                                text: "Verification Code",
                                size: 28,
                                isBold: true))
                        .padOnly(t: 40),
                    Center(
                            child: CustomText.title(
                                text:
                                    "Please type the verification code send to 9987477331",
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.center,
                                isBold: true))
                        .padOnly(b: 30),
                    Pinput(
                      controller: loginController.otpTFController,
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: fillColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(color: Colors.redAccent),
                      ),
                    ),
                    Center(
                        child: CustomText.richText(textSpans: [
                      TextSpan(
                          text: "Didn't receive a code? ",
                          style: CustomText.textStyle(
                              size: 13, color: ColorConstant.primaryTextColor)),
                      TextSpan(
                          text: "Resend code",
                          style: CustomText.textStyle(
                              size: 13,
                              color: ColorConstant.primaryColor,
                              decoration: TextDecoration.underline))
                    ])).padSymm(vertical: 30),
                    CommonWidget.roundedButton(
                        context: context,
                        title: "Verify OTP",
                        onTap: () async {
                          if (await loginController.verifyOTP()) {
                            SharedPref.set(SharedPref.userLogin,
                                loginController.mobileTFController.text);
                            CommonWidget.pop(context);
                            CommonWidget.replaceWith(
                                context, const HomeScreen());
                          }
                        }),
                  ],
                ).padSymm(vertical: 20, horizontal: 15),
              ),
            ));
  }
}
