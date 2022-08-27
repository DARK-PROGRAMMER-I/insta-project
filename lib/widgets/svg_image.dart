import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SvgImage extends StatelessWidget {
  final String? imgPath;
  final Color? imgColor;
  final double? imgH;
  final double? imgW;

  const SvgImage({
    Key? key,
    required this.imgPath,
    required this.imgColor,
    required this.imgH,
    required this.imgW
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/${imgPath}', color: imgColor, height: imgH, width: imgW,);
  }
}
