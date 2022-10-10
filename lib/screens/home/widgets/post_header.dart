import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/dimensions.dart';
import '../../../widgets/small_text.dart';
import '../../create_post/model/post_model.dart';

class PostHeader extends StatelessWidget {
  final int index;
  const PostHeader({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<List<PostModel?>?>(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.radius25),
                child: CachedNetworkImage(
                  imageUrl: postProvider![index]!.profImage!,
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
          )
        ]
    );
  }
}
