part of '../post_info_screen.dart';

class PostInfoAppbar extends StatelessWidget {
  const PostInfoAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    final userProvider = Provider.of<UserModel>(context);
    return AppBar(
      backgroundColor: AppColors.mobileBackgroundColor,
      leading: IconButton(
        icon: FaIcon(
         FontAwesomeIcons.arrowLeftLong,
          color: AppColors.mainWhiteColor,
          size: Dimensions.icon24,
        ),
        onPressed: (){
          Navigator.pop(context);
        },
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
          onPressed: ()async{
           if(postProvider.desText!.isNotEmpty){
             Utils.spinKit(color: AppColors.mainWhiteColor);
             bool status = await postProvider.uploadPost(userProvider.uid ?? 'user Id', userProvider.name?? 'name');
             if(status){
               Navigator.pop(context);
             }
           }
          },
        ),
      ],
    );
  }
}
