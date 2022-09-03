part of '../inside_home.dart';
class HomeAppbar extends StatelessWidget {
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: Dimensions.width10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgImage(imgPath: 'images/logo.svg', imgColor: AppColors.mainWhiteColor, imgH: Dimensions.height60, imgW: Dimensions.width5),
            SvgImage(imgPath: 'svgs/message.svg', imgColor: AppColors.mainWhiteColor, imgH: Dimensions.height30, imgW: Dimensions.width30),
          ],
        ),
      ),
    );
  }
}
