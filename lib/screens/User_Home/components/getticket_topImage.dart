import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class GetTicketTopImage extends StatelessWidget {
  const GetTicketTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Text(
          "Enter Your Data",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 30,
            color: kPrimaryColor,

          ),
        ),
        SizedBox(height: defaultPadding),
        Container(
          height: 200,
          child: Row(
            children: [
              // const Spacer(),
              Expanded(
                flex: 8,
                child: SvgPicture.asset("assets/icons/get_ticket.svg"),
              ),
              // const Spacer(),
            ],
          ),
        ),
        SizedBox(height: defaultPadding),
      ],
    );
  }
}
