import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_project/screens/create_post/post_info_screen.dart';
import 'package:insta_project/screens/create_post/providers/post_provider.dart';
import 'package:insta_project/screens/create_post/widgets/asset_holder.dart';
import 'package:insta_project/screens/create_post/widgets/crop_image.dart';
import 'package:insta_project/screens/navigation/nav_provider/navigation_provider.dart';
import 'package:insta_project/screens/navigation/navigation_screen.dart';
import 'package:insta_project/utils/colors.dart';
import 'package:insta_project/utils/utils.dart';
import 'package:insta_project/widgets/svg_image.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';

part 'widgets/post_appbar.dart';
part 'widgets/image_container.dart';
part 'widgets/gif_file.dart';
part 'widgets/crop_icon.dart';
part 'widgets/loading_gif.dart';


class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {


  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.square(Dimensions.height70),
          child: PostAppbar()),
      body: postProvider.isLoading! ? Utils.spinKit(
        color: AppColors.mainWhiteColor
      ): SingleChildScrollView(
        child: Column(
          children: [
            if(postProvider.imageFile !=  null)
              Stack(
                children : [
                  ImageContainer(
                  file: postProvider.imageFile,
                  isFull: postProvider.imageList.isEmpty,
                  onTap: (){postProvider.fetch_images();},
                ),
                  Positioned(
                    bottom: 20,
                    left: 10,
                    child:  GestureDetector(
                        onTap: ()async{
                         File? file= await cropImage(imageFile: postProvider.imageFile!);
                         postProvider.getImageFile(file!);
                        },

                        child: CropIcon()
                    ) ,
                    ),
                ]),
            if(postProvider.imageFile == null)
              LoadingGif(),
            if(postProvider.imageList.isNotEmpty)
              BottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius10),
                    topRight: Radius.circular(Dimensions.radius10),
                  )
                ),
                  onClosing: (){},
                  builder: (context){
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: Dimensions.pageHeight/2,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.blueColor,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(Dimensions.radius10),
                                  topLeft: Radius.circular(Dimensions.radius10)
                                )
                              ),
                              height: Dimensions.height50,
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: Dimensions.width10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    DropdownButtonHideUnderline(
                                        child:  DropdownButton(
                                          isDense: false,
                                          hint: Text('select'),
                                          value: postProvider.selectedFolder,
                                          items: postProvider.folderList.map((AssetPathEntity item) {
                                            return DropdownMenuItem(
                                                child: Text(item.name),
                                                value: item
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                             postProvider.getSelectedFolder(value as AssetPathEntity);
                                             postProvider.fetch_images();
                                          },
                                        )
                                ),
                                    IconButton(
                                        onPressed: postProvider.takePhoto,
                                        icon: Icon(Icons.camera_alt)
                                    )

                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: Dimensions.pageHeight,
                                child: GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: Dimensions.height20,
                                  mainAxisSpacing: Dimensions.width20,
                                ),
                                    itemCount: postProvider.imageList.length,
                                    itemBuilder: (context, index){
                                      return GestureDetector(
                                        onTap: (){
                                          setState(()async {
                                            File? file =await postProvider.imageList[index].file;
                                            postProvider.getImageFile(file);
                                          });
                                        },
                                        child: AssetThumbnail(
                                          asset: postProvider.imageList[index],
                                          onSelect: ()async{
                                            if (postProvider.selectedImage != postProvider.imageList[index]) {
                                              postProvider.getSelectedImage(postProvider.imageList[index]);
                                              File? file = await postProvider.selectedImage?.file;
                                              postProvider.getImageFile(file);
                                              if (file != null) {
                                                File? file = await cropImage(imageFile: postProvider.imageFile!);
                                                postProvider.getImageFile(file);
                                                if (file == null) {
                                                  postProvider.getSelectedImage(null);
                                                }
                                                setState(() {});
                                              }
                                              // changes done here
                                              // widget.onSubmit(file!);
                                            } else {
                                              postProvider.getSelectedImage(null);
                                              File? file = null;
                                              postProvider.getImageFile(file);
                                              setState(() {});
                                            }
                                          },
                                          selected: postProvider.selectedImage == postProvider.imageList[index],
                                        ),
                                      );
                                    }
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                enableDrag: false,
              )
          ],
        ),
      )
    );
  }
}