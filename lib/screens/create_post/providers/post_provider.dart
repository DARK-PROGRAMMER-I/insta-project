import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class PostProvider with ChangeNotifier{
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
  // Loading inspection
  bool? _isLoading = true;
  bool? get isLoading => _isLoading;
  getLoadingStatus(bool? load){
    _isLoading = load;
    notifyListeners();
  }

}