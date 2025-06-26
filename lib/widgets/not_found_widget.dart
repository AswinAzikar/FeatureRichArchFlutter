import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../gen/assets.gen.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Lottie.asset(Assets.lotties.notFound)),
      ],
    );
  }
}
