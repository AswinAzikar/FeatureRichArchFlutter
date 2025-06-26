import 'package:FeatureRichArchFlutter/exporter/exporter.dart';
import 'package:FeatureRichArchFlutter/services/size_utils.dart';
import 'package:FeatureRichArchFlutter/widgets/mini_loading_button.dart';
import 'package:flutter/material.dart';

class SampleModalExample extends StatefulWidget {
  const SampleModalExample({super.key});

  @override
  State<SampleModalExample> createState() => _SampleModalExampleState();
}

class _SampleModalExampleState extends State<SampleModalExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Modal Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MiniLoadingButton(
              text: "Tap to show modal ",
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(CustomPadding.paddingXL),
                    ),
                  ),
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: SizedBox(
                        height: SizeUtils.height * .4,
                        child: Column(
                          children: [
                            Center(
                              child: Text('This is a sample modal bottom sheet'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              })
        ],
      ),
    );
  }
}
