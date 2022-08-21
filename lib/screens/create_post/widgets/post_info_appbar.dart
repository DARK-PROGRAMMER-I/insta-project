part of '../post_info_screen.dart';

class PostInfoAppbar extends StatelessWidget {
  const PostInfoAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    return AppBar(
      backgroundColor: AppColors.mobileBackgroundColor,
      leading: IconButton(
        icon: FaIcon(
         FontAwesomeIcons.arrowLeftLong,
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
            Icons.check_sharp,
            color: AppColors.blueColor,
            size: Dimensions.icon40,
          ),
          onPressed: (){
           if(postProvider.desText!.isNotEmpty){

           }
          },
        ),
      ],
    );
  }
}
