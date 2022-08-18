import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_project/screens/create_post/edit_post_screen.dart';
import 'package:insta_project/utils/colors.dart';
import 'package:insta_project/utils/utils.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';

part 'widgets/post_appbar.dart';
part 'widgets/image_container.dart';
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
              ImageContainer(
                file: imageFile,
                isFull: assets.isEmpty,
                onTap: fetch_images,
              )
          ],
        ),
      )
    );
  }
}
