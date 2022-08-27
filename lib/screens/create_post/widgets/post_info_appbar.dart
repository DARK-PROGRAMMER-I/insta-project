part of '../post_info_screen.dart';

class PostInfoAppbar extends StatelessWidget {
  const PostInfoAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    final userProvider = Provider.of<UserModel>(context);
    final navProvider = Provider.of<NavigationProvider>(context);
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
             postProvider.getLoadingStatus(true);
             bool status = await postProvider.uploadPost(userProvider.uid ?? 'user Id', userProvider.name?? 'name');
             if(status){
               navProvider.selectedIndex(0);
               postProvider.getLoadingStatus(false);
               postProvider.getImageFile(null);
               Navigator.push(context, MaterialPageRoute(builder: (_)=> NavigationScreen()));

             }
             postProvider.getLoadingStatus(false);
           }
          },
        ),
      ],
    );
  }
}
