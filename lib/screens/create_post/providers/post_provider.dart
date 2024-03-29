import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_project/resources/storage_methods.dart';
import 'package:insta_project/screens/create_post/model/comment_model.dart';
import 'package:insta_project/screens/create_post/model/post_model.dart';
import 'package:insta_project/screens/create_post/res/post_storage.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:uuid/uuid.dart';

class PostProvider with ChangeNotifier{
  PostProvider(){
    fetch_images();
  }
  //Fetch Images
  fetch_images()async{
    if(selectedFolder == null){
      final folders = await PhotoManager.getAssetPathList();
      getFolderList(folders);
      getSelectedFolder(folderList.first);

    }
    final recentFolder = selectedFolder;
    final recentAssets = await recentFolder?.getAssetListRange(
      start: 0,
      end: 1000000,
    );
    getImageList(recentAssets!);
    getLoadingStatus(false);
    notifyListeners();
  }

  // Getting selected Folder
  AssetPathEntity? _selectedFolder;
  AssetPathEntity? get selectedFolder => _selectedFolder;
  getSelectedFolder(AssetPathEntity? select){
    _selectedFolder = select;
    notifyListeners();
    return select;
  }
  // Getting Folder List
  List<AssetPathEntity> _folderList = [];
  List<AssetPathEntity> get folderList => _folderList;
  getFolderList(List<AssetPathEntity> select){
    _folderList = select;
    notifyListeners();
    return select;
  }

  // Getting selected Image
  File? _imageFile;
  File? get imageFile => _imageFile;
  getImageFile(File? file){
    _imageFile = file;
    notifyListeners();
  }

  // Getting List of Images
  List<AssetEntity> _imageList = [];
  List<AssetEntity> get imageList => _imageList;
  getImageList(List<AssetEntity> select){
    _imageList = select;
    notifyListeners();
    return select;
  }

  // get selected Image
  AssetEntity? _selectedImage;
  AssetEntity? get selectedImage => _selectedImage;
  getSelectedImage(AssetEntity? select){
  _selectedImage = select;
    notifyListeners();
    return select;
  }


  // Loading inspection
  bool? _isLoading = true;
  bool? get isLoading => _isLoading;
  getLoadingStatus(bool? load){
    _isLoading = load;
    notifyListeners();
  }

  // Take Image
  takePhoto()async{
    // final postProvider = Provider.of<PostProvider>(context);
    XFile? imgFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if(imgFile != null){
      getImageFile(File(imgFile.path));
    }
  }

  // get description text
  String? _desText = '';
  String? get desText => _desText;
  getDesText(String? text){
    _desText = text;
    notifyListeners();
  }

  // Get image and store it in firebase
  Future<bool> uploadPost(String uid, String userName, String profImage)async{
    try{
      String? postImageUrl =await StorageMethod().uploadImagetoStorage('postPics', imageFile!, true);
      String postuid = Uuid().v1();
      PostModel post = PostModel(
        name: userName,
        uid: uid,
        dateCreated: DateTime.now(),
        description: desText,
        likes: [],
        comments: CommentModel() as Map<String, dynamic>,
        postId: postuid,
        postImgUrl: postImageUrl,
        profImage:profImage,
      );

      PostStorage().postThePost(post.toJson(), postuid);

      return true;
    }catch(e){
      print(e.toString());
      return false;
    }
    return false;
  }


}