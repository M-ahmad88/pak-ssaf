import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

import '../../utils/color_constants.dart';
import '../../utils/view_constants.dart';
class CurvedContainer extends StatelessWidget {
  const CurvedContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColumnSuper(
      innerDistance: -1,
      children: [
        Container(
            height: heightScaled(context: context, pixels: 365),
            decoration:
                ViewConstants.getRoundedContainerDecoration(solidColor: ThemeColor.fadeprimaryColor)),
        ClipPath(
          clipper: NativeClipper(),
          child: Container(
            height: 80,
            color: ThemeColor.fadeprimaryColor,
          ),
        ),
      ],
    );
  }
}

class NativeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
