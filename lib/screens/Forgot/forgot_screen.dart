import 'package:event/screens/forgot/components/forgot_form.dart';
import 'package:event/screens/forgot/components/forgot_screen_top_image.dart';
import 'package:flutter/material.dart';
import 'package:event/responsive.dart';
import '../../components/background.dart';

class forgot_password extends StatefulWidget {
  const forgot_password({super.key});

  @override
  State<forgot_password> createState() => _forgot_passwordState();
}

class _forgot_passwordState extends State<forgot_password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Background(
          child: SingleChildScrollView(
            child: Container(
              // Debug color for SingleChildScrollView
              child: Responsive(
                mobile: const MobileLoginScreen(),
                desktop: Row(
                  children: [
                    const Expanded(
                      child: ForgotScreenTopImage(),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 450,
                            child: ForgotForm(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const ForgotScreenTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: ForgotForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
