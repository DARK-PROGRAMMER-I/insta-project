part of '../home_screen.dart';
class PostCard extends StatefulWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width10, vertical: Dimensions.height10),
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
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.mainWhiteColor
                            ),
                          ),
                          SizedBox(width: Dimensions.width10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SmallText(name: 'account name',
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
                  CachedNetworkImage(
                    imageUrl: "https://img.freepik.com/free-vector/gradient-people-planting-tree-illustration_23-2149202056.jpg?w=1060&t=st=1661621684~exp=1661622284~hmac=4bc93d984937c2eba479b8e8a1bac112aa1afe84ae0368730ebbf31002c17b2f",
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  SizedBox(height: Dimensions.height10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgImage(imgPath: 'svgs/like.svg',
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
                  )

                ],
              ),
            ),
          );
        }
        ),
    );
  }
}
