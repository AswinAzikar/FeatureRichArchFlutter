// import 'package:FeatureRichArchFlutter/constants/constants.dart';
// import 'package:FeatureRichArchFlutter/gen/assets.gen.dart';
// import 'package:FeatureRichArchFlutter/services/size_utils.dart';
// import 'package:flutter/material.dart';

// class AuthPage extends StatelessWidget {
//   static const String path = '/authpage';

//   const AuthPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage(Assets.png.authbg.path), fit: BoxFit.cover)),
//       ),
//       bottomSheet: Container(
//         padding: EdgeInsets.symmetric(horizontal: CustomPadding.paddingXL),
//         decoration: BoxDecoration(
//           color: CustomColors.secondaryColor,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(CustomPadding.paddingXL),
//             topRight: Radius.circular(CustomPadding.paddingXL),
//           ),
//         ),
//         height: 300.v,
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Mobile No',
//               style: TextStyle(fontSize: 16.v, fontWeight: FontWeight.w500),
//             ),
//             Container(
//               height: 45.v,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(CustomPadding.padding),
//                   color: CustomColors.textfieldphoneColors),
//               child: TextFormField(
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: 'Enter Phone Number',
//                   hintStyle: TextStyle(
//                       color: CustomColors.textColorGrey,
//                       fontWeight: FontWeight.w500),
//                   contentPadding: EdgeInsets.symmetric(
//                       horizontal: CustomPadding.paddingLarge),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:FeatureRichArchFlutter/constants/constants.dart';
import 'package:FeatureRichArchFlutter/gen/assets.gen.dart';
import 'package:FeatureRichArchFlutter/services/size_utils.dart';
import 'package:FeatureRichArchFlutter/widgets/loading_button.dart';
import 'package:FeatureRichArchFlutter/widgets/mini_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AuthPage extends StatelessWidget {
  static const String path = '/authpage';

  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.png.authbg.path),
            fit: BoxFit.cover,
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: CustomPadding.paddingXL),
        decoration: BoxDecoration(
          color: CustomColors.secondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(CustomPadding.paddingXL),
            topRight: Radius.circular(CustomPadding.paddingXL),
          ),
        ),
        height: 300.v,
        width: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(CustomPadding.paddingLarge),
            Text(
              'Enter Your Number',
              style: TextStyle(
                fontSize: 15.v,
              ),
            ),
            Gap(CustomPadding.padding),
            Container(
              height: 50.v,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(CustomPadding.padding),
                color: CustomColors.textfieldphoneColors,
              ),
              child: IntlPhoneField(
                textAlignVertical: TextAlignVertical.center,
                autovalidateMode: AutovalidateMode.disabled,
                inputFormatters: [
                  // LengthLimitingTextInputFormatter(10),
                ],

                disableAutoFillHints: false,
                // pickerDialogStyle:
                //     PickerDialogStyle(backgroundColor: Colors.red),
                disableLengthCheck: false,
                initialCountryCode: 'IN',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.v,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  counter: SizedBox(),
                  hintText: 'Enter Phone Number',

                  // decoration: InputDecoration(
                  //   counter: SizedBox(),
                  border: InputBorder.none,
                ),
                //   hintText: 'Enter Phone Number',
                //   hintStyle: TextStyle(
                //     color: CustomColors.textColorGrey,
                //     fontWeight: FontWeight.w500,
                //   ),
                //   contentPadding: EdgeInsets.symmetric(
                //     horizontal: CustomPadding.paddingLarge,
                //     vertical: 12.v,
                //   ),
                // ),
                dropdownIcon: Icon(Icons.arrow_drop_down),
              ),
            ),
            Gap(CustomPadding.paddingLarge),
            LoadingButton(
              maxWidth: double.maxFinite,
              buttonLoading: false,
              text: 'Proceed',
              onPressed: () {},
            ),
            Gap(CustomPadding.paddingLarge),
            Divider(
              endIndent: 10.v,
            ),
            Row(
              children: [SvgPicture.asset(Assets.svg.google)],
            )
          ],
        ),
      ),
    );
  }
}
