part of '../create_post_screen.dart';
class CropIcon extends StatelessWidget {
  const CropIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Dimensions.width30,
        height: Dimensions.height30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.mainWhiteColor.withOpacity(0.3),

        ),
        child: Icon(
          Icons.crop, color: AppColors.mainWhiteColor, size: Dimensions.icon20,
        )
    );
  }
}
