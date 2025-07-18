import '/core/logger.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

import '../../../services/phone_number_hint.dart';
import '/constants/constants.dart';
import '/features/navigation_screen/navigation_screen.dart';
import '/gen/assets.gen.dart';
import '/services/size_utils.dart';
import '/widgets/loading_button.dart';

import '../../../services/shared_pref_services.dart';
import '../../../widgets/social_media_auth_button.dart';

class AuthPage extends StatefulWidget {
  static const String path = '/authpage';

  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isOtpStage = false;
  String fullPhoneNumber = '';
  bool isPhoneValid = false;
    final TextEditingController phoneController = TextEditingController();

@override
  void initState() {
    fetchAndSetPhoneNumber();
    // TODO: implement initState
    super.initState();
  }

   Future<void> fetchAndSetPhoneNumber() async {
    final number = await PhoneNumberHint.getPhoneNumber();
    if (number != null && mounted) {
      setState(() {
        phoneController.text = number.replaceAll('+91', '').trim();
        fullPhoneNumber = number.trim();
        isPhoneValid = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Gap(CustomPadding.paddingXXL),
              Gap(CustomPadding.paddingXXL),
              Text("Let's get started !",
                  style: TextStyle(
                      fontSize: 24.fSize, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(CustomPadding.paddingLarge),
                child: Lottie.asset(
                  Assets.lotties.authLottie2,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Positioned(
            top: kTextTabBarHeight / 2.v,
            left: CustomPadding.padding,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 20.v,
                )),
          )
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: CustomPadding.paddingXL),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: CustomColors.textColor.withAlpha(25),
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, -3),
            ),
          ],
          color: CustomColors.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(CustomPadding.paddingXL),
            topRight: Radius.circular(CustomPadding.paddingXL),
          ),
        ),
        height: 300.v,
        width: double.infinity,
        child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            transitionBuilder: (child, animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.2),
                  end: Offset.zero,
                ).animate(animation),
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: isOtpStage
                ? buildOtpInput(key: ValueKey('otp'))
                : buildPhoneNumberInput(key: ValueKey('phone'))),
      ),
    );
  }

Future<void> saveToken() async {
  await SharedPreferencesService.i.setValue(
    key: 'token',
    value: 'sampleValue',
  );

  final token = SharedPreferencesService.i.getValue(key: 'token');

  logWarning('Token saved successfully $token');
}

  Column buildPhoneNumberInput({Key? key}) {
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(CustomPadding.paddingLarge),
        Gap(CustomPadding.padding),
        Container(
          height: 50.v,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(CustomPadding.paddingXL),
            color: CustomColors.textfieldphoneColors,
          ),
          child: IntlPhoneField(
            controller: phoneController,
            onChanged: (phone) {
              fullPhoneNumber = phone.completeNumber;

              setState(() {
                isPhoneValid = phone.number.length == 10;
              });
            },
            textAlignVertical: TextAlignVertical.center,
            autovalidateMode: AutovalidateMode.disabled,
            inputFormatters: [],
            disableAutoFillHints: false,
            disableLengthCheck: false,
            initialCountryCode: 'IN',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.v,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintStyle: TextStyle(color: CustomColors.textColorLightGrey),
              counter: SizedBox(),
              hintText: 'Enter Phone Number',
              border: InputBorder.none,
            ),
            dropdownIcon: Icon(Icons.arrow_drop_down),
          ),
        ),
        Gap(CustomPadding.paddingLarge),
        LoadingButton(
          maxWidth: double.maxFinite,
          buttonLoading: false,
          text: 'Proceed',
          onPressed: isPhoneValid
              ? () {
                  setState(() {
                    isOtpStage = true;
                  });
                }
              : () {
                  Fluttertoast.showToast(
                    msg: "Please enter a valid phone number.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: CustomColors.scaffoldRed,
                    textColor: Colors.white,
                    fontSize: 14.0,
                  );
                },
        ),
        Gap(CustomPadding.paddingLarge),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "OR",
              style: TextStyle(
                fontSize: 16.v,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                color: CustomColors.textColorLightGrey,
              ),
            ),
          ],
        ),
        Divider(),
        Gap(CustomPadding.padding),
        Row(
          spacing: CustomPadding.paddingLarge,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialMediaAuthButton(
              assetPath: Assets.svg.google,
            ),
            SocialMediaAuthButton(assetPath: Assets.svg.facebook),
            SocialMediaAuthButton(assetPath: Assets.svg.gmail)
          ],
        )
      ],
    );
  }

  Widget buildOtpInput({Key? key}) {
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomGap.gapXL,
        // Gap(CustomPadding.paddingXL),
        Text(
          "Enter OTP",
          style: TextStyle(
            fontSize: 16.v,
            fontWeight: FontWeight.w500,
          ),
        ),
        // Gap(CustomPadding.paddingXL),
        CustomGap.gapXL,
        Pinput(
          length: 6,
          closeKeyboardWhenCompleted: true,
        ),
        // Gap(CustomPadding.paddingXL),
        CustomGap.gapXL,
        LoadingButton(
          maxWidth: double.maxFinite,
          buttonLoading: false,
          text: 'Verify OTP',
          onPressed: () {
            saveToken();

            Navigator.pushNamed(context, NavigationScreen.path);
          },
        ),
      ],
    );
  }
}
