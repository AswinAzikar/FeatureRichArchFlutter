import 'package:FeatureRichArchFlutter/constants/constants.dart';
import 'package:FeatureRichArchFlutter/features/navigation_screen/navigation_page.dart';
import 'package:FeatureRichArchFlutter/gen/assets.gen.dart';
import 'package:FeatureRichArchFlutter/services/size_utils.dart';
import 'package:FeatureRichArchFlutter/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isOtpStage
          ? AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  setState(() {
                    isOtpStage = false;
                  });
                },
              ),
              elevation: 0,
            )
          : null,
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            // image: DecorationImage(
            //     image: AssetImage(Assets.png.background.path),
            //     fit: BoxFit.fill,
            //     opacity: 0.4),
            ),
        child: Column(
          children: [
            Gap(CustomPadding.paddingXXL),
            Gap(CustomPadding.paddingXXL),
            Lottie.asset(
              Assets.lotties.authLottie2,
              // width: 200.v,
              // height: 200.v,
              fit: BoxFit.fill,
            ),
          ],
        ),
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
          color: CustomColors.secondaryColor,
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
                  begin: const Offset(0, 0.2), // Slide in from bottom
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
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     backgroundColor: CustomColors.scaffoldRed,
                  //     content: Text('Please enter a valid phone number.'),
                  //     duration: const Duration(seconds: 2),
                  //   ),
                  // );
                },
        ),
        Gap(CustomPadding.paddingLarge),
        Divider(
          thickness: 0.7,
          color: CustomColors.textColorLightGrey,
          endIndent: 40.v,
          indent: 40.v,
        ),
        Gap(CustomPadding.padding),
        Row(
          spacing: CustomPadding.paddingLarge,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {},
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: CustomColors.textColorLightGrey)),
                    child: SvgPicture.asset(Assets.svg.google))),
            GestureDetector(
                onTap: () {},
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: CustomColors.textColorLightGrey)),
                    child: SvgPicture.asset(Assets.svg.facebook))),
            GestureDetector(
                onTap: () {},
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: CustomColors.textColorLightGrey)),
                    child: SvgPicture.asset(Assets.svg.gmail))),
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
        Gap(CustomPadding.paddingXL),
        Text(
          "Enter OTP",
          style: TextStyle(
            fontSize: 16.v,
            fontWeight: FontWeight.w500,
          ),
        ),
        Gap(CustomPadding.padding),
        Pinput(
          length: 6,
          closeKeyboardWhenCompleted: true,
        ),
        Gap(CustomPadding.paddingLarge),
        LoadingButton(
          maxWidth: double.maxFinite,
          buttonLoading: false,
          text: 'Verify OTP',
          onPressed: () {
            Navigator.pushNamed(context, NavigationPage.path);

            // Handle OTP verification
          },
        ),
      ],
    );
  }
}
