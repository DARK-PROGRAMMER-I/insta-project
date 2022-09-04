import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SvgImage extends StatelessWidget {
  final String? imgPath;
  final Color? imgColor;
  final double? imgH;
  final double? imgW;
  final VoidCallback? ontap;

  SvgImage({
    Key? key,
    this.ontap,
    required this.imgPath,
    required this.imgColor,
    required this.imgH,
    required this.imgW
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontap ?? (){},
        child: SvgPicture.asset('assets/${imgPath}', color: imgColor, height: imgH, width: imgW,));
  }
}
