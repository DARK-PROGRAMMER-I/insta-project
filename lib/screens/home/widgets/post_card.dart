// part of '../inside_home.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_project/screens/home/widgets/animation_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/utils.dart';
import '../../../widgets/small_text.dart';
import '../../../widgets/svg_image.dart';
import '../../create_post/model/post_model.dart';
import '../inside_home.dart';
import '../provider/home_provider.dart';

class PostCard extends StatefulWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<List<PostModel?>?>(context);
    final homeProvider = Provider.of<HomeProvider>(context);

    return postProvider != null ? Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: postProvider.length,
        padding: EdgeInsets.all(0),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width10, vertical: Dimensions.height20),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(Dimensions.radius25),
                            child: CachedNetworkImage(
                              imageUrl: postProvider[index]!.profImage!,
                              height: Dimensions.height40,
                              width: Dimensions.width40,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                          ),
                          SizedBox(width: Dimensions.width10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SmallText(name: postProvider[index]!.name!,
                                bold: true,
                                size: Dimensions.height20,
                                align: false,),
                              SmallText(
                                name: 'specialities', bold: false, align: false,)
                            ],
                          ),
                        ],
                      ),
                      SvgImage(imgPath: 'svgs/menu_dots.svg',
                          imgColor: AppColors.mainWhiteColor,
                          imgH: Dimensions.height20,
                          imgW: Dimensions.width30),
                    ],
                  ),
                  SizedBox(height: Dimensions.height20,),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CachedNetworkImage(
                        imageUrl: postProvider[index]!.postImgUrl!,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      GestureDetector(
                        onDoubleTap: (){
                          homeProvider.getLikeAnimationStatus(true);
                        },
                        child: LikeAnimation(
                          child: Icon(Icons.favorite, color: Colors.white,size: 50,),
                          isAnimating: homeProvider.isLikeAniamtion,
                          smallLike: false,
                          onEnd: (){
                            homeProvider.getLikeAnimationStatus(true);
                          },
                          duration: Duration(milliseconds: 400),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: Dimensions.height10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          homeProvider.liked! ? SvgImage(
                              ontap: (){
                                homeProvider.getLikedStatus(false);
                              },
                              imgPath: 'svgs/heart_inside.svg',
                              imgColor: AppColors.mainWhiteColor,
                              imgH: Dimensions.height25,
                              imgW: Dimensions.width25) :
                          SvgImage(
                              ontap: (){
                                homeProvider.getLikedStatus(true);
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
                  ),
                  SizedBox(height: Dimensions.height5,),
                  SmallText(name: postProvider[index]!.likes?.length == 0? '0 Likes' : postProvider[index]!.likes!.length.toString(), bold: true
                  ),
                  SizedBox(height: Dimensions.height5,),
                  Row(
                    children: [
                      SmallText(name: postProvider[index]!.name!, bold: true
                      ),
                      SizedBox(width: Dimensions.width5,),
                      SmallText(name:  postProvider[index]!.description!, bold: false
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.height5,),
                  postProvider[index]!.comments?.length == 0 ? SizedBox.shrink() :
                  SmallText(name: 'View all ${postProvider[index]!.comments!.length.toString() } comments', bold: false, color: AppColors.greyColor,),

                  SizedBox(height: Dimensions.height5,),
                  Container(
                    child: SmallText(name: DateFormat.yMMMd().format(postProvider[index]!.dateCreated!), bold: false,),
                  ),
                  SizedBox(height: Dimensions.height5,),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(Dimensions.radius25),
                        child: CachedNetworkImage(
                          imageUrl: postProvider[index]!.profImage!,
                          height: Dimensions.height40,
                          width: Dimensions.width40,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                      SizedBox(width: Dimensions.width10,),
                      Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: 'Add a Comment'
                            ),
                          ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
        ),
    ) :
    Center(child: Utils.spinKit(),)
    ;
  }
}
