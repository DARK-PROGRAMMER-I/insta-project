import '../common_libs.dart';


class PostBottom extends StatelessWidget {
  final int? index;
  const PostBottom({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<List<PostModel?>?>(context);
    final homeProvider = Provider.of<HomeProvider>(context);
    postProvider?[index!]?.likes?.contains(homeProvider.userId);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [

            postProvider![index!]!.likes!.contains(homeProvider.userId) ? SvgImage(
                ontap: ()async{
                  await homeProvider.updateLikes(
                      postId: postProvider[index!]!.postId!,
                      uid: homeProvider.userId!,
                      likes: postProvider[index!]!.likes!
                  );
                },
                imgPath: 'svgs/heart_inside.svg',
                imgColor: AppColors.mainWhiteColor,
                imgH: Dimensions.height25,
                imgW: Dimensions.width25) :
            SvgImage(
                ontap: ()async{
                  await homeProvider.updateLikes(
                      postId: postProvider[index!]!.postId!,
                      uid: homeProvider.userId!,
                      likes: postProvider[index!]!.likes!
                  );
                },
                imgPath: 'svgs/like.svg',
                imgColor: AppColors.mainWhiteColor,
                imgH: Dimensions.height25,
                imgW: Dimensions.width25),
            SizedBox(width: Dimensions.width10,),
            SvgImage(imgPath: 'svgs/comment1.svg',
                imgColor: AppColors.mainWhiteColor,
                imgH: Dimensions.height30,
                imgW: Dimensions.width30),
            SizedBox(width: Dimensions.width10,),
            SvgImage(imgPath: 'svgs/share.svg',
                imgColor: AppColors.mainWhiteColor,
                imgH: Dimensions.height25,
                imgW: Dimensions.width25),
          ],
        ),
        SvgImage(imgPath: 'svgs/save.svg',
            imgColor: AppColors.mainWhiteColor,
            imgH: Dimensions.height25,
            imgW: Dimensions.width25),
      ],
    );
  }
}
