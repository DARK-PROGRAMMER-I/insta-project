import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_project/screens/create_post/edit_post_screen.dart';
import 'package:insta_project/screens/create_post/providers/post_provider.dart';
import 'package:insta_project/screens/create_post/widgets/crop_image.dart';
import 'package:insta_project/utils/colors.dart';
import 'package:insta_project/utils/utils.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';

part 'widgets/post_appbar.dart';
part 'widgets/image_container.dart';
part 'widgets/gif_file.dart';
class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  bool loading  = true;
  bool saving = false;
  List<AssetEntity> assets = [];
  AssetEntity ? selectedAssets;
  List<AssetPathEntity> folderList = [];
  AssetPathEntity? currentFolder;
  File? imageFile;

  @override
  void initState() {
    fetch_images();
    super.initState();
  }

  fetch_images()async{
    if(currentFolder == null){
      final folders = await PhotoManager.getAssetPathList();
      folderList = folders;
      currentFolder = folderList.first;
    }
    final recentFolder = currentFolder;
    final recentAssets = await recentFolder?.getAssetListRange(
        start: 0,
        end: 1000000,
    );
    assets = recentAssets!;
    loading = false;
    if(mounted){
      setState(() {
      });
    }
  }
XFile ? file;
  takePhoto()async{
    XFile? imgFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if(imgFile != null){
      setState(() {
        imageFile = File(imgFile.path);
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.square(Dimensions.height70),
          child: PostAppbar()),
      body: loading ? Utils.spinKit(
        color: AppColors.mainWhiteColor
      ): SingleChildScrollView(
        child: Column(
          children: [
            if(imageFile !=  null)
              Stack(
                children : [
                  ImageContainer(
                  file: imageFile,
                  isFull: assets.isEmpty,
                  onTap: fetch_images,
                ),
                  Positioned(
                    bottom: 20,
                    left: 10,
                    child:  GestureDetector(
                        onTap: ()async{
                          imageFile = await cropImage(imageFile: imageFile!);
                        },

                        child: Container(
                          width: Dimensions.width30,
                          height: Dimensions.height30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.mainWhiteColor.withOpacity(0.3),

                          ),
                            child: Icon(
                              Icons.crop, color: AppColors.mainWhiteColor, size: Dimensions.icon20,
                            )
                        )
                    ) ,
                    ),
                ]),
            if(imageFile == null)
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Image(
                      image: NetworkImage('https://th.bing.com/th/id/R.60e72028b41866ae64c5bd4711f81474?rik=5ed1XByDSyID5A&pid=ImgRaw&r=0'),
                    ),
                  ),
                ),
              ),
            if(assets.isNotEmpty)
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
                                          value: postProvider.selected,
                                          items: folderList.map((AssetPathEntity item) {
                                            return DropdownMenuItem(
                                                child: Text(item.name),
                                                value: item
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            print(postProvider.getSelected(value as AssetPathEntity));
                                             postProvider.getSelected(value as AssetPathEntity);
                                             currentFolder = value as AssetPathEntity;
                                          },
                                        )
                                ),
                                    IconButton(
                                        onPressed: takePhoto,
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
                                    itemBuilder: (context, index){
                                      return assets.length != 0 ?  Container(
                                        color: Colors.deepPurple,
                                        height: Dimensions.height30,
                                        width: Dimensions.width30,
                                      ):

                                      Container(
                                        height: Dimensions.height30,
                                        width: Dimensions.width30,
                                        child: assets[index].,
                                      );
                                    }
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              )

          ],
        ),
      )
    );
  }
}
//GridView.builder(
//                       itemCount: assets.length,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           childAspectRatio: 0.85,
//                           crossAxisCount: 3,
//                           crossAxisSpacing: Dimensions.height20,
//                           mainAxisSpacing: Dimensions.width20,
//                         ),
//                         itemBuilder: (_, index) {
//                           return AssetThumbnail(
//                               asset: assets[index],
//                               onSelect: () async {
//                                 if (selectedAssets != assets[index]) {
//                                   selectedAssets = assets[index];
//                                   file = await selectedAssets?.file;
//                                   //setState(() {});
//                                   // changes done here
//                                   if (file != null) {
//                                     file = await cropImage(imageFile: file!);
//                                     if (file == null) {
//                                       selectedAssets = null;
//                                     }
//                                     setState(() {});
//                                   }
//                                   // changes done here
//                                   widget.onSubmit(file!);
//                                 } else {
//                                   selectedAssets = null;
//                                   file = null;
//                                   setState(() {});
//                                 }
//                               },
//                               selected: selectedAssets == assets[index]);
//                         }
//                     );