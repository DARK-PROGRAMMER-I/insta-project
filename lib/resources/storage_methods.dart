import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:insta_project/utils/utils.dart';

class StorageMethod{
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> uploadImagetoStorage(String folderName , File img, bool isPost)async{
      Reference ref =
          await _storage.ref().child(folderName).child(_auth.currentUser!.uid);

      UploadTask task = ref.putFile(img);
        // TaskSnapshot snap = await task.snapshot;
        final TaskSnapshot taskSnapshot = await task.whenComplete(() {});
        final String url = await taskSnapshot.ref.getDownloadURL();


      return url;


  }
}