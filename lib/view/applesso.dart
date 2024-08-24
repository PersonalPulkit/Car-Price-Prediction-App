import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../custom_widgets/elevatedbutton.dart';

class AppleSSO extends StatefulWidget {
  final Size? size;
  const AppleSSO({super.key, this.size});

  @override
  State<AppleSSO> createState() => _AppleSSOState();
}

class _AppleSSOState extends State<AppleSSO> {
  @override
  Widget build(BuildContext context) {
    return CustomElevatedButtonWithIcon(
      text: "Coming soon",
      callBack: () {
        // Navigator.pushNamed(
        //     context, AppRoutes.dashboard);
      },
      icon: const Icon(FontAwesomeIcons.apple),
      size: widget.size,
    );
  }
}
