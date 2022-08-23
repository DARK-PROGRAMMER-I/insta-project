part of '../create_post_screen.dart';

class PostAppbar extends StatelessWidget {
  const PostAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    final navProvider = Provider.of<NavigationProvider>(context);

    return AppBar(
      backgroundColor: AppColors.mobileBackgroundColor,
      leading: IconButton(
        icon: FaIcon(
          FontAwesomeIcons.xmark,
          color: AppColors.mainWhiteColor,
          size: Dimensions.icon24,
        ),
        onPressed: (){
          if(postProvider.imageFile != null){
            postProvider.getImageFile(null);
            navProvider.selectedIndex(0);
          }else{
            navProvider.selectedIndex(0);

          }
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
            Icons.arrow_forward,
            color: AppColors.mainWhiteColor,
            size: Dimensions.icon24,),
          onPressed: (){
            postProvider.imageFile == null ? Utils.showSnakbar('Pick Atleast 1 Image', context) :
                Navigator.push(context, MaterialPageRoute(builder: (_)=> PostInfoScreen()));
          },
        ),
      ],
    );
  }
}
