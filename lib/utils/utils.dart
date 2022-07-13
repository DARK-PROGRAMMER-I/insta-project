import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source)async{
  ImagePicker picker = ImagePicker();
  XFile? image = await picker.pickImage(source: source);

  if(image != null){
    return image.readAsBytes();
  }else{
    'Error picking Image';
  }
}
