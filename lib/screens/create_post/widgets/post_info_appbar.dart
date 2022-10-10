part of '../post_info_screen.dart';

class PostInfoAppbar extends StatelessWidget {
  const PostInfoAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    final userProvider = Provider.of<UserModel?>(context);
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
             bool status = await postProvider.uploadPost(userProvider?.uid ?? 'user Id', userProvider?.name?? 'name', userProvider?.imgUrl ?? 'https://www.bing.com/ck/a?!&&p=6f1d8d0761238f38JmltdHM9MTY2MTY5OTk0NSZpZ3VpZD1iOGRhNGRjMS1hYmVlLTQ3ZjQtOGE2ZS1jNGE1ZGFlYWI3YWEmaW5zaWQ9NTQ1OQ&ptn=3&hsh=3&fclid=c0fcedaf-26e4-11ed-9e78-e2d9d2b2de7b&u=a1L2ltYWdlcy9zZWFyY2g_cT1Qcm9maWxlJTIwSWNvbiZGT1JNPUlRRlJCQSZpZD04NzgwOUIzMjE1NjM0RDc2Qzc2MEY1MUU5ODg5RjY4Qjg2QzFBNDE4&ntb=1' );

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
