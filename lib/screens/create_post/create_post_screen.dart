import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_project/utils/colors.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../utils/dimensions.dart';

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
      appBar: AppBar(
        leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.cross,
            color: AppColors.mainWhiteColor,
            size: Dimensions.icon24,),
          onPressed: (){},
        ),
      ),
    );
  }
}
