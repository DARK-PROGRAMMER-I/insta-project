// part of '../inside_home.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_project/controllers/auth_ctr/authentication.dart';
import 'package:insta_project/screens/home/post_data.dart';
import 'package:insta_project/screens/home/widgets/animation_widget.dart';
import 'package:insta_project/screens/home/widgets/post_bottom.dart';
import 'package:insta_project/screens/home/widgets/post_header.dart';
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
                  PostHeader(index: index),
                  SizedBox(height: Dimensions.height20,),
                  GestureDetector(
                    onDoubleTap: ()async{
                      homeProvider.getLikeAnimationStatus(true);
                      await homeProvider.updateLikes(
                          postId: postProvider[index]!.postId!,
                          uid: homeProvider.userId!,
                          likes: postProvider[index]!.likes!
                      );

                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: postProvider[index]!.postImgUrl!,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                        AnimatedOpacity(
                          duration: Duration(milliseconds: 500),
                          opacity: homeProvider.isLikeAniamtion ? 1:0,
                          child: LikeAnimation(
                            child: Icon(Icons.favorite, color: Colors.white,size: 50,),
                            isAnimating: homeProvider.isLikeAniamtion,
                            smallLike: false,
                            onEnd: (){
                              homeProvider.getLikeAnimationStatus(false);
                            },
                            duration: Duration(milliseconds: 500),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.height10,),
                  PostBottom(index: index),
                  SizedBox(height: Dimensions.height5,),
                  SmallText(name: postProvider[index]!.likes?.length == 0? '0 like' : '${postProvider[index]!.likes!.length.toString()} likes', bold: true
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
