import 'dart:io';
import 'package:flutter/material.dart';
import 'package:insta_project/widgets/small_text.dart';
import '../../utils/dimensions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_project/screens/create_post/providers/post_provider.dart';
import 'package:insta_project/utils/colors.dart';
import 'package:provider/provider.dart';
import '../../widgets/big_text.dart';

part 'widgets/post_info_appbar.dart';
part 'widgets/image_description.dart';
part 'widgets/post_storage_method.dart';
class PostInfoScreen extends StatefulWidget {
  File? imgFile;
  PostInfoScreen({Key? key, this.imgFile}) : super(key: key);

  @override
  State<PostInfoScreen> createState() => _PostInfoScreenState();
}

class _PostInfoScreenState extends State<PostInfoScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.square(Dimensions.height70),
          child: PostInfoAppbar()
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageAndDescription(),
            Divider(color: AppColors.greyColor,),
            Padding(
                padding: EdgeInsets.symmetric(vertical: Dimensions.height15),
                child: SmallText(name: 'Tag people', bold: false, align: false,color: AppColors.mainWhiteColor,),
            ),
            Divider(color: AppColors.greyColor,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Dimensions.height15),
              child: SmallText(name: 'Add location', bold: false, align: false,color: AppColors.mainWhiteColor,),
            ),
            Divider(color: AppColors.greyColor,),
            SizedBox(height: 15,),
            SmallText(name: 'Also post to', bold: false, align: false,color: AppColors.mainWhiteColor,),
          ],
        ),
      ),
    );
  }


}
