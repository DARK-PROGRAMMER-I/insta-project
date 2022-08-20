import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethod{
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImagetoStorage(String folderName , Uint8List img, bool isPost)async{
    Reference ref = await _storage.ref().child(folderName).child(_auth.currentUser!.uid);
    UploadTask task = ref.putData(img);
    TaskSnapshot snap = await task.snapshot;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}