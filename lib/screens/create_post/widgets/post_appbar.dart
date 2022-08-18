part of '../create_post_screen.dart';

class PostAppbar extends StatelessWidget {
  final File? imgFile;
  const PostAppbar({Key? key, this.imgFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mobileBackgroundColor,
      leading: IconButton(
        icon: FaIcon(
          FontAwesomeIcons.xmark,
          color: AppColors.mainWhiteColor,
          size: Dimensions.icon24,
        ),
        onPressed: (){},
      ),
      title: BigText(
        name: 'New Post',
        size: Dimensions.bigText,
        color: AppColors.mainWhiteColor,
      ),
      actions: [

        IconButton(
          icon: Icon(
            Icons.arrow_forward,
            color: AppColors.mainWhiteColor,
            size: Dimensions.icon24,),
          onPressed: (){
            imgFile != null ? Utils.toastMessage('Select atleast 1 image'):
                EditPostScreen();
          },
        ),
      ],
    );
  }
}
