part of '../home_screen.dart';
class HomeAppbar extends StatelessWidget {
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgImage(imgPath: 'images/logo.svg', imgColor: AppColors.mainWhiteColor, imgH: Dimensions.height60, imgW: Dimensions.width50),
            SvgImage(imgPath: 'svgs/message.svg', imgColor: AppColors.mainWhiteColor, imgH: Dimensions.height30, imgW: Dimensions.width30),
          ],
        ),
      ),
    );
  }
}
