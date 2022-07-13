import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source)async{
  ImagePicker iPic = ImagePicker();
  XFile? image = await iPic.pickImage(source: source);
  if(image != null){
    return image.readAsBytes();
  }else{
    'Error picking Image';
  }
}