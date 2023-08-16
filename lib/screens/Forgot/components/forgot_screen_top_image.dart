import 'package:flutter/material.dart';
import 'package:event/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotScreenTopImage extends StatefulWidget {
  const ForgotScreenTopImage({super.key});

  @override
  State<ForgotScreenTopImage> createState() => _ForgotScreenTopImageState();
}

class _ForgotScreenTopImageState extends State<ForgotScreenTopImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: defaultPadding * 2),
        Text(
          "Forgot Password",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: kPrimaryColor,

          ),
        ),
        SizedBox(height: defaultPadding * 2),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SvgPicture.asset("assets/icons/forgot.svg"),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
